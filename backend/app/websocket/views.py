import asyncio
from typing import Annotated

from fastapi import APIRouter
from fastapi import Depends
from fastapi import WebSocket
from sqlalchemy.ext.asyncio import async_sessionmaker
from starlette.authentication import requires

from app.db import get_session
from app.models.sensor import Sensor
from app.models.users import User

router = APIRouter(prefix="/ws", tags=["ws"])


@router.websocket("/sensor")
@requires(["authenticated"])
async def sensor(
        websocket: WebSocket,
        dbsession: Annotated[async_sessionmaker, Depends(get_session)],
):
	async with dbsession.begin() as session:
		user = await User.get_by_username(session, websocket.user.username)

    await websocket.accept()

    while True:
    	await asyncio.sleep(30)
