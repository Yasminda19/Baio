from datetime import datetime
from pathlib import Path
from typing import Annotated, List

from fastapi import APIRouter
from fastapi import Depends
from fastapi import HTTPException
from fastapi import Request
from fastapi import Response
from fastapi import status
from fastapi import UploadFile
from fastapi.responses import FileResponse

from app.models.sensor import SensorSchema
from app.models.users import UserSchema
from app.security.authentication import get_current_user

from .schemas import SensorListResponse
from .schemas import SensorRecordsResponse
from .use_cases import SensorAdd
from .use_cases import SensorGet
from .use_cases import SensorList
from .use_cases import SensorRecords

router = APIRouter(prefix="/sensors", tags=["sensor"])

assets_dir = Path(".", "assets")


@router.get("", response_model=SensorListResponse)
async def get_sensors_list(
        current_user: Annotated[UserSchema,
                                Depends(get_current_user)],
        use_case: SensorList = Depends(SensorList),
) -> SensorListResponse:
    if current_user.id == -1:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED)
    return await use_case.execute(current_user)


@router.post("", response_model=SensorSchema)
async def get_sensors_list(
        current_user: Annotated[UserSchema,
                                Depends(get_current_user)],
        data: SensorSchema,
        use_case: SensorAdd = Depends(SensorAdd),
) -> SensorSchema:
    if current_user.id == -1:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED)
    return await use_case.execute(data, current_user)


@router.get("/{address}", response_model=SensorSchema)
async def get_sensor(
        current_user: Annotated[UserSchema,
                                Depends(get_current_user)],
        address: str,
        use_case: SensorGet = Depends(SensorGet),
) -> SensorSchema:
    # TODO: limit user access
    if current_user.id == -1:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED)
    if not address.startswith("0x"):
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND)
    return await use_case.execute(address, current_user)


@router.get("/{address}/records", response_model=SensorRecordsResponse)
async def get_records(
        current_user: Annotated[UserSchema,
                                Depends(get_current_user)],
        address: str,
        use_case: SensorRecords = Depends(SensorRecords),
) -> SensorRecordsResponse:
    # TODO: limit user access
    if current_user.id == -1:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED)
    if not address.startswith("0x"):
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND)
    return await use_case.execute(address, current_user)


@router.get("/{address}/live.jpeg")
async def get_live_image(address: str) -> FileResponse:
    # TODO: limit user access
    if not address.startswith("0x"):
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND)

    file = assets_dir / address / "live.jpeg"

    if not file.exists():
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND)

    return FileResponse(file,
                        media_type="image/jpeg",
                        filename=f"{address}.jpeg",
                        content_disposition_type="inline")


@router.post("/{address}/live.jpeg")
async def get_live_image(
    request: Request,
    address: str,
    photo: UploadFile,
):
    # TODO: limit user access
    if not address.startswith("0x"):
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND)

    if photo.content_type != "image/jpeg":
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST)

    buf = await photo.read()

    parent = assets_dir / address
    if not parent.is_dir():
        parent.mkdir()

    file = assets_dir / address / "live.jpeg"
    file.write_bytes(buf)

    return Response(status_code=status.HTTP_204_NO_CONTENT)