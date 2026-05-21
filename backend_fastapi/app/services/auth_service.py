from sqlalchemy.orm import Session
from fastapi import HTTPException, status

from app.database.models import User
from app.database.schemas import UserSignup, UserLogin

from app.core.security import (
    hash_password,
    verify_password,
    create_access_token
)

from app.core.constants import (
    DEFAULT_FREE_CREDITS,
    EMAIL_ALREADY_EXISTS,
    INVALID_CREDENTIALS
)


def create_user(
    user_data: UserSignup,
    db: Session
):

    existing_user = db.query(User).filter(
        User.email == user_data.email
    ).first()

    if existing_user:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=EMAIL_ALREADY_EXISTS
        )

    hashed_password = hash_password(
        user_data.password
    )

    new_user = User(
        name=user_data.name,
        email=user_data.email,
        password=hashed_password,
        credits=DEFAULT_FREE_CREDITS
    )

    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    token = create_access_token({
        "sub": str(new_user.id)
    })

    return {
        "success": True,
        "access_token": token,
        "user": {
            "id": new_user.id,
            "name": new_user.name,
            "email": new_user.email,
            "credits": new_user.credits
        }
    }


def authenticate_user(
    user_data: UserLogin,
    db: Session
):

    existing_user = db.query(User).filter(
        User.email == user_data.email
    ).first()

    if not existing_user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail=INVALID_CREDENTIALS
        )

    is_valid_password = verify_password(
        user_data.password,
        existing_user.password
    )

    if not is_valid_password:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail=INVALID_CREDENTIALS
        )

    token = create_access_token({
        "sub": str(existing_user.id)
    })

    return {
        "success": True,
        "access_token": token,
        "user": {
            "id": existing_user.id,
            "name": existing_user.name,
            "email": existing_user.email,
            "credits": existing_user.credits
        }
    }