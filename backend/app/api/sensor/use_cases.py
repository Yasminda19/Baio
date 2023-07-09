from http import HTTPStatus
from typing import Annotated, List, Sequence

from fastapi import Depends
from fastapi import HTTPException
from fastapi import status
from sqlalchemy import select
from sqlalchemy.ext.asyncio import async_sessionmaker
from sqlalchemy.ext.asyncio import AsyncSession

from app.api.schemas import Meta
from app.db import get_dapp
from app.db import get_session
from app.models.sensor import Sensor
from app.models.sensor import SensorSchema
from app.models.users import User
from app.models.users import UserSchema
from app.service.dapp import BaioDApp
from app.service.dapp import Record

from .schemas import SensorListResponse
from .schemas import SensorRecordsResponse


class SensorRecords:

    def __init__(
        self,
        session: Annotated[async_sessionmaker[AsyncSession],
                           Depends(get_session)],
        dapp: Annotated[BaioDApp, Depends(get_dapp)],
    ) -> None:
        self.dbsession = session
        self.dapp = dapp

    async def execute(
        self,
        address: str,
        current_user: UserSchema,
    ) -> SensorRecordsResponse:
        async with self.dbsession() as session:
            sensor = await Sensor.get_by_address(session, address)
            if sensor is None:
                raise HTTPException(status.HTTP_404_NOT_FOUND)
            if sensor.user_id != current_user.id:
                raise HTTPException(status.HTTP_404_NOT_FOUND)

        records: List[Record] = []

        events = self.dapp.get_ledger_events(address)
        for event in events:
            try:
                record = Record.from_event(event)
                records.append(record)
            except:
                pass

        return SensorRecordsResponse(meta=Meta(total=len(records)),
                                     data=records)


class SensorAdd:

    def __init__(
        self,
        session: Annotated[async_sessionmaker[AsyncSession],
                           Depends(get_session)],
        dapp: Annotated[BaioDApp, Depends(get_dapp)],
    ) -> None:
        self.dbsession = session
        self.dapp = dapp

    async def execute(
        self,
        data: SensorSchema,
        current_user: UserSchema,
    ) -> SensorSchema:
        try:
            address = self.dapp.get_ledger_address(data.address)
            if address:
                return data
        except:
            pass

        try:
            self.dapp.new_ledger(data.address)
            self.dapp.get_ledger_address(data.address)
        except:
            raise HTTPException(status.HTTP_500_INTERNAL_SERVER_ERROR,
                                "failed to create ledger contract for sensor")

        async with self.dbsession() as session:
            new = await Sensor.create(session, current_user, data.address,
                                      data.name)

        return SensorSchema.from_orm(new)


class SensorGet:

    def __init__(
        self,
        session: Annotated[async_sessionmaker[AsyncSession],
                           Depends(get_session)],
    ) -> None:
        self.dbsession = session

    async def execute(
        self,
        address: str,
        current_user: UserSchema,
    ) -> SensorSchema:
        async with self.dbsession() as session:
            sensor = await Sensor.get_by_address(session, address)
            if sensor is None:
                raise HTTPException(status.HTTP_404_NOT_FOUND)
            if sensor.user_id != current_user.id:
                raise HTTPException(status.HTTP_404_NOT_FOUND)

        return SensorSchema.from_orm(sensor)


class SensorList:

    def __init__(
        self,
        session: Annotated[async_sessionmaker[AsyncSession],
                           Depends(get_session)],
    ) -> None:
        self.dbsession = session

    async def execute(
        self,
        current_user: UserSchema,
    ) -> SensorListResponse:
        async with self.dbsession() as session:
            stmt = select(Sensor).where(Sensor.user_id == current_user.id)
            rows = await session.execute(stmt)
            sensors = rows.scalars()
        return SensorListResponse(data=iter(sensors))
