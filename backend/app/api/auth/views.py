from typing import Annotated

from fastapi import APIRouter
from fastapi import Depends
from fastapi import Request
from fastapi import Response

from app.models.users import UserSchema
from app.security.authentication import get_current_user

from .schemas import AuthLoginRequest
from .schemas import AuthLoginResponse
from .use_cases import AuthLogin

router = APIRouter(prefix="/auth", tags=["auth"])


@router.get("/user", response_model=UserSchema)
async def get_auth_user(
        user: Annotated[UserSchema, Depends(get_current_user)]) -> UserSchema:
    return user


@router.post("/login", response_model=AuthLoginResponse)
async def login(
        res: Response,
        data: AuthLoginRequest,
        use_case: AuthLogin = Depends(AuthLogin),
) -> AuthLoginResponse:
    result = await use_case.execute(data.username, data.password)
    res.set_cookie(key="token", value=result.access_token, samesite="lax")
    return result
