from pydantic import BaseModel


class Meta(BaseModel):
    total: int


class MetaPagination(Meta):
    page: int
    per_page: int