import logging
import os


LOGS_FOLDER = "logs"

os.makedirs(LOGS_FOLDER, exist_ok=True)

LOG_FILE = os.path.join(
    LOGS_FOLDER,
    "app.log"
)

logging.basicConfig(
    level=logging.INFO,
    format=(
        "%(asctime)s - "
        "%(levelname)s - "
        "%(message)s"
    ),
    handlers=[
        logging.FileHandler(LOG_FILE),
        logging.StreamHandler()
    ]
)

logger = logging.getLogger("ai_image_generator")


def log_info(message: str):
    logger.info(message)


def log_warning(message: str):
    logger.warning(message)


def log_error(message: str):
    logger.error(message)


def log_exception(message: str):
    logger.exception(message)