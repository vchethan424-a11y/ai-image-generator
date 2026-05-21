from fastapi import HTTPException, status

from app.core.constants import (
    MAX_PROMPT_LENGTH,
    SUPPORTED_IMAGE_STYLES
)


def validate_prompt(
    prompt: str
):

    if not prompt:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Prompt is required"
        )

    if len(prompt.strip()) == 0:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Prompt cannot be empty"
        )

    if len(prompt) > MAX_PROMPT_LENGTH:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=f"Prompt exceeds {MAX_PROMPT_LENGTH} characters"
        )

    return True


def validate_image_style(
    style: str
):

    if style not in SUPPORTED_IMAGE_STYLES:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=(
                f"Unsupported style. "
                f"Allowed styles: {SUPPORTED_IMAGE_STYLES}"
            )
        )

    return True


def validate_email(
    email: str
):

    if "@" not in email:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Invalid email address"
        )

    return True


def validate_password(
    password: str
):

    if len(password) < 6:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Password must be at least 6 characters"
        )

    return True