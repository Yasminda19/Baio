from http import HTTPStatus
import os
from random import randbytes
import time
from typing import Annotated, AsyncIterator
from uuid import UUID

from fastapi import Depends
from fastapi import HTTPException
from jose import jwt
from passlib.context import CryptContext
from sqlalchemy.ext.asyncio import async_sessionmaker

from app.db import get_session
from app.models.users import User
from app.models.users import UserSchema
from app.settings import Settings

from .schemas import AuthLoginResponse

AsyncSession = Annotated[async_sessionmaker, Depends(get_session)]
_crypt_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
_secret = Settings().BAIO_SECRET


class AuthLogin:
    def __init__(self, session: AsyncSession) -> None:
        self.dbsession = session

    async def execute(self, username: str, password: str) -> AuthLoginResponse:
        credentials_exception = HTTPException(
            status_code=HTTPStatus.UNAUTHORIZED,
            detail="Could not validate credentials",
            headers={"WWW-Authenticate": "Bearer"},
        )

        async with self.dbsession() as session:
            user = await User.get_by_username(session, username)

        if user is None:
            raise credentials_exception

        if not _crypt_context.verify(password, user.password):
            raise credentials_exception

        now = int(time.time())
        token = jwt.encode(
            {
                "iat": now,
                "sub": user.username,
                "exp": now + 3600,  # expire in 1 hour
                "jti": os.urandom(16).hex(),
            },
            _secret,
            algorithm="HS512"
        )

        return AuthLoginResponse(access_token=token, token_type="bearer")
