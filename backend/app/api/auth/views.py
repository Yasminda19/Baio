from fastapi import APIRouter
from fastapi import Depends
from fastapi import Request

from .schemas import AuthLoginRequest
from .schemas import AuthLoginResponse
from .schemas import GetUserResponse
from .use_cases import AuthLogin

router = APIRouter(prefix="/auth", tags=["auth"])


@router.get("", response_model=GetUserResponse)
async def get_current_user(request: Request) -> GetUserResponse:
    return GetUserResponse.parse_obj(request.user)


@router.post("/login", response_model=AuthLoginResponse)
async def login(
        request: Request,
        data: AuthLoginRequest,
        use_case: AuthLogin = Depends(AuthLogin),
) -> AuthLoginResponse:
    return await use_case.execute(data.username, data.password)
