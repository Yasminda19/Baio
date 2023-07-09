from functools import lru_cache
import logging
from typing import AsyncIterator

from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.ext.asyncio import async_sessionmaker
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.ext.asyncio import create_async_engine

from app.service.dapp import BaioDApp
from app.settings import get_config

logger = logging.getLogger(__name__)

_cfg = get_config()

async_engine = create_async_engine(
    _cfg.DB_URI,
    pool_pre_ping=True,
)

async_session_maker: async_sessionmaker[AsyncSession] = async_sessionmaker(
    bind=async_engine,
    autoflush=False,
    future=True,
)

_web3 = BaioDApp(_cfg.ETH_ENDPOINT, _cfg.CONTRACT_ABI, _cfg.CONTRACT_ADDRESS,
                 _cfg.MASTER_KEY)


@lru_cache
def get_dapp():
    return _web3


async def get_session() -> AsyncIterator[async_sessionmaker]:
    try:
        yield async_session_maker
    except SQLAlchemyError as e:
        logger.exception(e)
