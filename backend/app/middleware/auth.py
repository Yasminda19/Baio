from http import HTTPStatus
from typing import Optional, Tuple

from fastapi.exceptions import HTTPException
from fastapi.responses import JSONResponse
from fastapi.security.utils import get_authorization_scheme_param
from jose import jwt
from jose.exceptions import JWTError
from starlette.authentication import AuthCredentials
from starlette.authentication import \
    AuthenticationBackend as BaseAuthenticationBackend
from starlette.middleware.authentication import \
    AuthenticationMiddleware as BaseAuthenticationMiddleware
from starlette.requests import HTTPConnection

from app.db import AsyncSessionLocal
from app.models.users import User
from app.models.users import UserSchema
from app.settings import Settings


class AuthenticationMiddleware(BaseAuthenticationMiddleware):
    pass


class AuthenticationBackend(BaseAuthenticationBackend):
    secret: str

    def __init__(self, secret: str) -> None:
        self.secret = Settings().BAIO_SECRET

    async def authenticate(  # type: ignore
        self, request: HTTPConnection) -> Tuple[AuthCredentials,
                                                Optional[UserSchema]]:
        authorization = request.headers.get("authorization")
        if authorization is None:
            return AuthCredentials(None), None

        scheme, token = get_authorization_scheme_param(authorization)
        if scheme.lower() != "bearer":
            return AuthCredentials(None), None

        try:
            claims = jwt.decode(token, self.secret, algorithms="HS512", options={
                "require_iat": True,
                "require_jti": True,
                "require_exp": True,
                "require_sub": True,
            })
        except:
            return AuthCredentials(None), None

        async with AsyncSessionLocal() as session:
            user = await User.get_by_username(session, claims.get("sub"))

        if user is None:
            return AuthCredentials(None), None

        return AuthCredentials(["authenticated"]), UserSchema.from_orm(user)
