from typing import Annotated, Literal, Optional, Tuple, TypedDict

from fastapi import Depends
from fastapi import HTTPException
from fastapi import Request
from fastapi import status
from fastapi.security.utils import get_authorization_scheme_param
import jwt
from sqlalchemy.ext.asyncio import async_sessionmaker
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_dapp
from app.db import get_session
from app.models.sensor import Sensor
from app.models.users import User
from app.models.users import UserSchema
from app.service.dapp import BaioDApp
from app.settings import get_config
from app.settings import Settings


class Claims(TypedDict):
    iss: str
    sub: str


class AuthTokenBearer:

    def __init__(self):
        pass

    async def __call__(
            self,
            request: Request) -> Optional[Tuple[Literal["bearer", "eth"], str]]:
        authorization = request.headers.get("Authorization")
        if authorization:
            scheme, param = get_authorization_scheme_param(authorization)
            scheme = scheme.lower()
            if scheme not in ["bearer", "eth"]:
                raise HTTPException(
                    status_code=status.HTTP_401_UNAUTHORIZED,
                    detail="Not authenticated",
                    headers={"WWW-Authenticate": "Bearer"},
                )
            return scheme, param

        token = request.cookies.get("token")
        if not token:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="Not authenticated",
                headers={"WWW-Authenticate": "Bearer"},
            )

        return "bearer", token


auth_token = AuthTokenBearer()


async def get_current_user(
    config: Annotated[Settings, Depends(get_config)],
    auth: Annotated[Tuple[Literal["bearer", "eth"], str],
                    Depends(auth_token)],
    dbsession: Annotated[async_sessionmaker[AsyncSession],
                         Depends(get_session)],
    dapp: Annotated[BaioDApp, Depends(get_dapp)],
) -> UserSchema:
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )

    scheme, token = auth

    if scheme == "bearer":
        try:
            claims: Claims = jwt.decode(token,
                                        config.SECRET,
                                        algorithms=["HS512"])
        except jwt.PyJWTError:
            raise credentials_exception

        async with dbsession() as session:
            user = await User.get_by_username(session, claims["sub"])

        if user is None:
            raise credentials_exception

        return UserSchema.from_orm(user)
    elif scheme == "eth":
        try:
            claims: Claims = dapp.decode(token)
        except:
            raise credentials_exception

        async with dbsession() as session:
            sensor = await Sensor.get_by_address(session, claims["iss"])

        if sensor is None:
            return None

        return UserSchema(id=-1, username=sensor.address)

    raise credentials_exception