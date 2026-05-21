from fastapi import (
    APIRouter,
    HTTPException,
    Depends,
    status,
)

from sqlalchemy.orm import Session

from app.database.connection import get_db

from app.database.models import User

from app.database.schemas import (
    UserSignup,
    UserLogin,
)

from app.core.security import (
    hash_password,
    verify_password,
    create_access_token,
)

router = APIRouter(
    prefix="/auth",
    tags=["Authentication"],
)


# ============================================
# SIGNUP
# ============================================

@router.post("/signup")
def signup(
    user: UserSignup,
    db: Session = Depends(get_db),
):

    existing_user = (
        db.query(User)
        .filter(User.email == user.email)
        .first()
    )

    if existing_user:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Email already registered",
        )

    hashed_password = hash_password(
        user.password,
    )

    new_user = User(
        name=user.name,
        email=user.email,
        password=hashed_password,
        credits=10,
    )

    db.add(new_user)

    db.commit()

    db.refresh(new_user)

    token = create_access_token(
        {"sub": str(new_user.id)}
    )

    return {
        "success": True,
        "message": "User created successfully",
        "access_token": token,
        "user": {
            "id": new_user.id,
            "name": new_user.name,
            "email": new_user.email,
            "credits": new_user.credits,
        },
    }


# ============================================
# LOGIN
# ============================================

@router.post("/login")
def login(
    user: UserLogin,
    db: Session = Depends(get_db),
):

    existing_user = (
        db.query(User)
        .filter(User.email == user.email)
        .first()
    )

    if not existing_user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid email or password",
        )

    is_password_valid = verify_password(
        user.password,
        existing_user.password,
    )

    if not is_password_valid:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid email or password",
        )

    token = create_access_token(
        {"sub": str(existing_user.id)}
    )

    return {
        "success": True,
        "access_token": token,
        "user": {
            "id": existing_user.id,
            "name": existing_user.name,
            "email": existing_user.email,
            "credits": existing_user.credits,
        },
    }