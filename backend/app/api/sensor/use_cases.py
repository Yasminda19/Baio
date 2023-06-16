from http import HTTPStatus
from typing import Annotated, List

from fastapi import Depends
from fastapi import HTTPException
from sqlalchemy import select
from sqlalchemy.ext.asyncio import async_sessionmaker
from sqlalchemy.ext.asyncio import AsyncSession

from app.api.schemas import Meta
from app.db import get_session
from app.db import web3
from app.models.sensor import Sensor
from app.models.users import User
from app.models.users import UserSchema
from app.service.dapp import Record

from .schemas import SensorListResponse
from .schemas import SensorRecordsResponse

async_session_maker = Annotated[async_sessionmaker[AsyncSession],
                                Depends(get_session)]


class SensorRecords:

    def __init__(self, session: async_session_maker) -> None:
        self.dbsession = session

    async def execute(self, address: str):
        # async with self.dbsession() as session:
        #     sensor = await Sensor.get_by_address(session, address)
        #     if sensor is None:
        #         raise HTTPException(HTTPStatus.NOT_FOUND)

        records: List[Record] = []

        events = web3.get_ledger_events(address)
        for event in events:
            # version = event["args"]["version"]
            # data = event["args"]["data"]

            try:
                record = Record.from_event(event)
                records.append(record)
            except:
                pass

        return SensorRecordsResponse(meta=Meta(total=len(records)),
                                     data=records)


class SensorList:

    def __init__(self, session: async_session_maker) -> None:
        self.dbsession = session

    async def execute(self, user_: UserSchema):
        async with self.dbsession() as session:
            stmt = select(Sensor)
            rows = await session.execute(stmt)
            sensors = rows.scalars().all()
