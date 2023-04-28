from typing import Optional
from pydantic import BaseModel


class GetSastToken(BaseModel):
    token: Optional[str]
