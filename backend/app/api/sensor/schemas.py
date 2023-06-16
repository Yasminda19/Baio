from typing import List

from pydantic import BaseModel

from app.api.schemas import Meta
from app.models.sensor import SensorSchema
from app.service.dapp import Record


class SensorRecordsResponse(BaseModel):
    meta: Meta
    data: List[Record]


class SensorListResponse(BaseModel):
    data: List[SensorSchema]
