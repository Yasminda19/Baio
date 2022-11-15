from fastapi import FastAPI

from app.routers.v1 import APIV1Router
from app.routers.ws import WebSocketRouter

app = FastAPI()
app.include_router(APIV1Router)
app.include_router(WebSocketRouter)