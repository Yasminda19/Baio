from pydantic import BaseModel

from app.models.users import UserSchema


class GetUserResponse(UserSchema):
    pass


class AuthLoginResponse(BaseModel):
    access_token: str
    token_type: str


class AuthLoginRequest(BaseModel):
    username: str
    password: str
