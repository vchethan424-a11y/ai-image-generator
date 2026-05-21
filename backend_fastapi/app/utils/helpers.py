import uuid
import os
from datetime import datetime


def generate_unique_filename(
    extension: str = "png"
):

    unique_id = uuid.uuid4()

    timestamp = datetime.now().strftime(
        "%Y%m%d%H%M%S"
    )

    filename = f"{timestamp}_{unique_id}.{extension}"

    return filename


def ensure_folder_exists(
    folder_path: str
):

    if not os.path.exists(folder_path):
        os.makedirs(folder_path)


def format_api_response(
    success: bool,
    message: str,
    data=None
):

    return {
        "success": success,
        "message": message,
        "data": data
    }


def sanitize_prompt(
    prompt: str
):

    cleaned_prompt = prompt.strip()

    cleaned_prompt = " ".join(
        cleaned_prompt.split()
    )

    return cleaned_prompt