import os

from fastapi import APIRouter
from fastapi import FastAPI
from fastapi.responses import JSONResponse

from app.api.auth.views import router as auth_v1_router
from app.api.sensor.views import router as sensor_v1_router
from app.settings import config

app = FastAPI(title="Baio", docs_url="/docs")
# app.add_middleware(AuthenticationMiddleware,
#                    backend=AuthenticationBackend(secret=config.SECRET))

apiv1 = APIRouter(prefix="/api/v1", tags=["apiv1"])
apiv1.include_router(auth_v1_router)
apiv1.include_router(sensor_v1_router)

app.include_router(apiv1)


@app.get("/", include_in_schema=False)
def index() -> JSONResponse:
    return JSONResponse({"status": "ok"})


@app.get("/login")
def login():
    return ""
