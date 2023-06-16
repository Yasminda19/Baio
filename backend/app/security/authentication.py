from typing import Annotated, Literal, Optional, TypedDict

from fastapi import Response
import jwt

from app.db import async_session_maker
from app.db import web3
from app.models.sensor import Sensor
from app.models.users import User
from app.models.users import UserSchema
from app.settings import config


class Claims(TypedDict):
    iss: str
    sub: str


# class Authenticator:

#     def __init__(self) -> None:
#         pass

#     async def current_user(
#         scheme:
#     ) -> Optional[UserSchema]:
#         if scheme == "bearer":
#             try:
#                 claims: Claims = jwt.decode(token,
#                                             config.SECRET,
#                                             algorithms=["HS512"])
#             except jwt.PyJWTError:
#                 return None

#             async with async_session_maker() as session:
#                 user = await User.get_by_username(session, claims["sub"])

#             if user is None:
#                 return None

#             return UserSchema.from_orm(user)
#         elif scheme == "eth":
#             try:
#                 claims: Claims = web3.decode(token)
#             except:
#                 return None

#             async with async_session_maker() as session:
#                 sensor = await Sensor.get_by_address(session, claims["iss"])

#             if sensor is None:
#                 return None

#             return UserSchema(id=-1, username=sensor.address)
#         return None