import os

from sqlservice import AsyncDatabase

from app.db.model import BaseModel

database = AsyncDatabase(uri=os.environ["DATABASE_URI"], model_class=BaseModel)
