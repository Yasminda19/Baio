from dotenv import dotenv_values
from pydantic import BaseSettings


class Settings(BaseSettings):
    DB_URI: str
    SECRET: str
    ETH_ENDPOINT: str
    CONTRACT_ADDRESS: str
    CONTRACT_ABI: str

    class Config:
        env_file = ".env", ".env.prod"
        env_file_encoding = "utf-8"
        env_prefix = "BAIO_"


config = Settings(_env_file=".env", _env_file_encoding="utf-8")
