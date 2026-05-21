import uuid
import os
import requests


def generate_ai_image(prompt: str):

    # ============================================
    # CREATE FOLDER
    # ============================================

    os.makedirs(
        "generated_images",
        exist_ok=True,
    )

    # ============================================
    # FILE NAME
    # ============================================

    filename = (
        f"generated_{uuid.uuid4()}.jpg"
    )

    save_path = (
        f"generated_images/{filename}"
    )

    # ============================================
    # TEMP IMAGE SOURCE
    # ============================================

    image_url = (
        "https://picsum.photos/1024"
    )

    # ============================================
    # DOWNLOAD IMAGE
    # ============================================

    response = requests.get(
        image_url,
        timeout=30,
    )

    # ============================================
    # SAVE IMAGE
    # ============================================

    with open(save_path, "wb") as file:
        file.write(response.content)

    # ============================================
    # RETURN PUBLIC URL
    # ============================================

    return (
        f"http://localhost:8000/"
        f"generated_images/{filename}"
    )