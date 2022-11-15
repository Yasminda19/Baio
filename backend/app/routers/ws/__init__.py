from dataclasses import dataclass
from typing import Dict, Any

from fastapi import APIRouter, WebSocket

WebSocketRouter = APIRouter(prefix="/ws")


class KeepAliveSpec:
    pass


@dataclass
class ChannelRequestSpec:
    uid: int

    @classmethod
    def from_dict(cls, data: Dict[Any, Any]):
        return cls(uid=data["uid"])


@WebSocketRouter.websocket("/channel")
async def ws(websocket: WebSocket):
    await websocket.accept()

    data = await websocket.receive_json()
    spec = ChannelRequestSpec.from_dict(data)

    print(spec)

    while True:
        data = await websocket.receive_json()
        await websocket.send_json(data)