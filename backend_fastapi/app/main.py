from fastapi import FastAPI

from fastapi.middleware.cors import (
    CORSMiddleware,
)

from fastapi.staticfiles import (
    StaticFiles,
)

from app.api.routes.auth import (
    router as auth_router,
)

from app.api.routes.generate import (
    router as generate_router,
)

from app.api.routes.history import (
    router as history_router,
)

from app.api.routes.users import (
    router as users_router,
)

app = FastAPI(
    title="AI Image Generator API",
    version="1.0.0",
)

# ============================================
# CORS
# ============================================

app.add_middleware(
    CORSMiddleware,

    allow_origins=["*"],

    allow_credentials=True,

    allow_methods=["*"],

    allow_headers=["*"],
)

# ============================================
# STATIC FILES
# ============================================

app.mount(
    "/generated_images",

    StaticFiles(
        directory="generated_images",
    ),

    name="generated_images",
)

# ============================================
# ROUTES
# ============================================

app.include_router(auth_router)

app.include_router(generate_router)

app.include_router(history_router)

app.include_router(users_router)

# ============================================
# ROOT
# ============================================

@app.get("/")
def root():

    return {
        "message":
        "AI Image Generator API Running"
    }