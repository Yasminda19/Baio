from __future__ import annotations

from enum import Enum
from typing import AsyncIterator, Optional, TYPE_CHECKING

from pydantic import BaseModel
from sqlalchemy import select
from sqlalchemy import String
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column
from sqlalchemy.orm import relationship

from .base import Base
from .sensor import Sensor


class User(Base):
    __tablename__ = "users"

    id: Mapped[int] = mapped_column("id",
                                    autoincrement=True,
                                    nullable=False,
                                    unique=True,
                                    primary_key=True)

    username: Mapped[str] = mapped_column("username",
                                          String(length=64),
                                          nullable=False,
                                          unique=True)

    password: Mapped[str] = mapped_column("password",
                                          String(length=64),
                                          nullable=True)

    sensors: Mapped[list[Sensor]] = relationship(
        "Sensor",
        back_populates="user",
    )

    @classmethod
    async def get_by_id(cls, session: AsyncSession, uid: int) -> Optional[User]:
        stmt = select(cls).where(cls.id == uid)
        return await session.scalar(stmt.order_by(cls.id))

    @classmethod
    async def get_by_username(cls, session: AsyncSession,
                              username: str) -> Optional[User]:
        stmt = select(cls).where(cls.username == username)
        return await session.scalar(stmt.order_by(cls.id))


class UserSchema(BaseModel):
    id: int
    username: str

    class Config:
        orm_mode = True
