from __future__ import annotations

from enum import Enum
from typing import AsyncIterator, Optional

from pydantic import BaseModel
from sqlalchemy import Boolean
from sqlalchemy import ForeignKey
from sqlalchemy import select
from sqlalchemy import String
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import Mapped
from sqlalchemy.orm import mapped_column
from sqlalchemy.orm import relationship

from .base import Base
from .users import User


class Sensor(Base):
    __tablename__ = "sensors"

    id: Mapped[int] = mapped_column("id",
                                    autoincrement=True,
                                    nullable=False,
                                    unique=True,
                                    primary_key=True)

    address: Mapped[str] = mapped_column("address",
                                         String(length=64),
                                         nullable=False,
                                         unique=True)

    user_id: Mapped[int] = mapped_column("user_id",
                                         ForeignKey("users.id"),
                                         nullable=False)

    user: Mapped[User] = relationship("User", back_populates="sensors")

    @classmethod
    async def get_by_id(cls, session: AsyncSession, uid: int) -> Optional[Sensor]:
        stmt = select(cls).where(cls.id == uid)
        return await session.scalar(stmt.order_by(cls.id))

    @classmethod
    async def get_by_address(cls, session: AsyncSession,
                             address: str) -> Optional[Sensor]:
        stmt = select(cls).where(cls.address == address)
        return await session.scalar(stmt.order_by(cls.id))

    @classmethod
    async def create(cls, session: AsyncSession, address: str,
                     user: User) -> Instance:
        sensor = cls(address=address, user_id=user.id)
        session.add(sensor)
        await session.flush()

        new = await cls.get_by_id(session, id)
        if not new:
            raise RuntimeError("Instance not created")
        return new

    async def delete(self, session: AsyncSession) -> None:
        await session.delete(self)
        await session.flush()
