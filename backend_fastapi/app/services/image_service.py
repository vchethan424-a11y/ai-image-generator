import os
import uuid

from sqlalchemy.orm import Session
from fastapi import HTTPException, status

from app.database.models import (
    GeneratedImage,
    User
)

from app.services.huggingface_service import (
    generate_ai_image
)

from app.core.constants import (
    GENERATED_IMAGES_FOLDER,
    IMAGE_GENERATED_SUCCESS,
    IMAGE_GENERATION_FAILED,
    INSUFFICIENT_CREDITS
)


def generate_and_save_image(
    prompt: str,
    style: str,
    current_user: User,
    db: Session
):

    if current_user.credits <= 0:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail=INSUFFICIENT_CREDITS
        )

    try:

        image_path = generate_ai_image(prompt)

        generated_image = GeneratedImage(
            user_id=current_user.id,
            prompt=prompt,
            image_url=image_path,
            style=style
        )

        current_user.credits -= 1

        db.add(generated_image)

        db.commit()

        db.refresh(generated_image)

        return {
            "success": True,
            "message": IMAGE_GENERATED_SUCCESS,
            "data": {
                "id": generated_image.id,
                "prompt": generated_image.prompt,
                "image_url": generated_image.image_url,
                "style": generated_image.style,
                "remaining_credits": current_user.credits,
                "created_at": generated_image.created_at
            }
        }

    except Exception as error:

        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"{IMAGE_GENERATION_FAILED}: {str(error)}"
        )


def get_user_generation_history(
    current_user: User,
    db: Session
):

    history = (
        db.query(GeneratedImage)
        .filter(
            GeneratedImage.user_id == current_user.id
        )
        .order_by(
            GeneratedImage.created_at.desc()
        )
        .all()
    )

    return {
        "success": True,
        "count": len(history),
        "data": history
    }


def delete_generated_image(
    image_id: int,
    current_user: User,
    db: Session
):

    image = (
        db.query(GeneratedImage)
        .filter(
            GeneratedImage.id == image_id,
            GeneratedImage.user_id == current_user.id
        )
        .first()
    )

    if not image:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Image not found"
        )

    if image.image_url and os.path.exists(image.image_url):
        os.remove(image.image_url)

    db.delete(image)

    db.commit()

    return {
        "success": True,
        "message": "Image deleted successfully"
    }