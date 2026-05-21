from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.database.connection import get_db
from app.database.models import GeneratedImage, User
from app.core.security import get_current_user

router = APIRouter(prefix="/history", tags=["History"])


@router.get("")
def get_history(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):

    history = (
        db.query(GeneratedImage)
        .filter(GeneratedImage.user_id == current_user.id)
        .order_by(GeneratedImage.created_at.desc())
        .all()
    )

    return {
        "success": True,
        "count": len(history),
        "data": history
    }


@router.delete("/{image_id}")
def delete_history(
    image_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
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
            status_code=404,
            detail="Image not found"
        )

    db.delete(image)
    db.commit()

    return {
        "success": True,
        "message": "History deleted successfully"
    }