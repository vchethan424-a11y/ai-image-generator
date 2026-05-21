# ============================================
# APP DETAILS
# ============================================

APP_NAME = "AI Image Generator API"
APP_VERSION = "1.0.0"


# ============================================
# JWT CONFIG
# ============================================

ACCESS_TOKEN_EXPIRE_DAYS = 7
ALGORITHM = "HS256"


# ============================================
# IMAGE GENERATION
# ============================================

DEFAULT_IMAGE_STYLE = "realistic"

SUPPORTED_IMAGE_STYLES = [
    "realistic",
    "anime",
    "cinematic",
    "3d_render",
    "cyberpunk",
    "fantasy",
    "cartoon",
    "watercolor",
    "oil_painting"
]


# ============================================
# FREE USER SETTINGS
# ============================================

DEFAULT_FREE_CREDITS = 10

MAX_PROMPT_LENGTH = 1000


# ============================================
# HUGGING FACE MODEL
# ============================================

HUGGINGFACE_MODEL_URL = (
    "https://api-inference.huggingface.co/models/"
    "black-forest-labs/FLUX.1-schnell"
)


# ============================================
# IMAGE STORAGE
# ============================================

GENERATED_IMAGES_FOLDER = "generated_images"


# ============================================
# API RESPONSE MESSAGES
# ============================================

USER_CREATED_SUCCESS = "User created successfully"

LOGIN_SUCCESS = "Login successful"

INVALID_CREDENTIALS = "Invalid email or password"

EMAIL_ALREADY_EXISTS = "Email already registered"

IMAGE_GENERATED_SUCCESS = "Image generated successfully"

IMAGE_GENERATION_FAILED = "Image generation failed"

INSUFFICIENT_CREDITS = "Insufficient credits"

INVALID_TOKEN = "Invalid token"

HISTORY_DELETED_SUCCESS = "History deleted successfully"

IMAGE_NOT_FOUND = "Image not found"


# ============================================
# API TAGS
# ============================================

AUTH_TAG = "Authentication"

GENERATE_TAG = "Generate"

HISTORY_TAG = "History"

USERS_TAG = "Users"


# ============================================
# HTTP STATUS CODES
# ============================================

HTTP_OK = 200

HTTP_CREATED = 201

HTTP_BAD_REQUEST = 400

HTTP_UNAUTHORIZED = 401

HTTP_FORBIDDEN = 403

HTTP_NOT_FOUND = 404

HTTP_SERVER_ERROR = 500