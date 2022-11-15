from fastapi import APIRouter

from app.routers.v1.healthrecords import router as HealthRecordRouter

APIV1Router = APIRouter(prefix="/api/v1")

APIV1Router.include_router(HealthRecordRouter)