from fastapi import APIRouter

from app.db import database
from app.db.model import HealthRecord

router = APIRouter(prefix="/healthrecord")


@router.get("/")
async def get_all():
    async with database.begin() as session:
        query = HealthRecord.select()
        records = await session.all(query)
    return {"status": "ok", "data": records}
