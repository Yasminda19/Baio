from os import getenv

from fastapi import APIRouter
from fastapi import Request
from starlette.authentication import requires

from .schemas import GetSastToken

router = APIRouter(prefix="/sast", tags=["sast"])


@router.get("/token", response_model=GetSastToken)
@requires(["authenticated"])
async def get_current_user(request: Request) -> GetSastToken:
    return GetSastToken(token=getenv("SAST_TOKEN", None))
