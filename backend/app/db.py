import logging
from typing import AsyncIterator

from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.ext.asyncio import async_sessionmaker
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.ext.asyncio import create_async_engine

from app.service.dapp import BaioDApp
from app.settings import config

logger = logging.getLogger(__name__)

async_engine = create_async_engine(
    config.DB_URI,
    pool_pre_ping=True,
)

async_session_maker: async_sessionmaker[AsyncSession] = async_sessionmaker(
    bind=async_engine,
    autoflush=False,
    future=True,
)

web3 = BaioDApp(config.ETH_ENDPOINT, config.CONTRACT_ABI,
                config.CONTRACT_ADDRESS)


async def get_session() -> AsyncIterator[async_sessionmaker]:
    try:
        yield async_session_maker
    except SQLAlchemyError as e:
        logger.exception(e)
