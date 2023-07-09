from functools import lru_cache

from pydantic import BaseSettings


class Settings(BaseSettings):
    DB_URI: str
    SECRET: str
    ETH_ENDPOINT: str
    CONTRACT_ADDRESS: str
    CONTRACT_ABI: str
    MASTER_KEY: str

    class Config:
        env_file = ".env", ".env.prod"
        env_file_encoding = "utf-8"
        env_prefix = "BAIO_"


@lru_cache
def get_config():
    config = Settings()
    return config
