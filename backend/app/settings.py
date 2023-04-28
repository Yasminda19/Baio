import os
from pathlib import Path

from pydantic import BaseSettings


class Settings(BaseSettings):
    DB_URI: str
    ECHO_SQL: bool
    BAIO_SECRET: str

    class Config:
        env_file = ".env", ".env.prod"
        env_file_encoding = "utf-8"
