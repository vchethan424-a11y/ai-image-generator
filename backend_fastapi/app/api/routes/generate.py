from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from app.database.connection import get_db
from app.database.models import GeneratedImage, User
from app.database.schemas import GenerateRequest
from app.services.huggingface_service import generate_ai_image
from app.core.security import get_current_user

router = APIRouter(prefix="/generate", tags=["Generate"])


@router.post("")
def generate_image(
    payload: GenerateRequest,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):

    if current_user.credits <= 0:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Insufficient credits"
        )

    image_url = generate_ai_image(payload.prompt)

    generated_image = GeneratedImage(
        user_id=current_user.id,
        prompt=payload.prompt,
        image_url=image_url,
        style=payload.style
    )

    current_user.credits -= 1

    db.add(generated_image)
    db.commit()
    db.refresh(generated_image)

    return {
        "success": True,
        "message": "Image generated successfully",
        "data": {
            "id": generated_image.id,
            "prompt": generated_image.prompt,
            "image_url": generated_image.image_url,
            "style": generated_image.style,
            "remaining_credits": current_user.credits
        }
    }