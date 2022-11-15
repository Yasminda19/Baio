from turtle import position
from sqlalchemy import Column, types
from sqlservice import declarative_base

BaseModel = declarative_base()


class User(BaseModel):
    __tablename__ = "users"

    id = Column(types.Integer(), primary_key=True)
    email = Column(types.String(), unique=True, nullable=False)
    password = Column(types.String(), nullable=False)


# class Agent(BaseModel):
#     __tablename__ = "agents"


class HealthRecord(BaseModel):
    __tablename__ = "healthrecords"

    id = Column(types.Integer(), primary_key=True)
    datetime = Column(types.DateTime(), nullable=False)
    uid = Column(types.Integer(), nullable=False)
    channel = Column(types.Integer(), nullable=False)
    status = Column(types.String(10))
    rmtp = Column(types.String(10))
    hr_real = Column(types.Integer())
    rr_dl = Column(types.Integer())
    rr_real = Column(types.Integer())
    temp_dl = Column(types.Float())
    temp_real = Column(types.Float())
    position = Column(types.String(20))
    awake_status = Column(types.String(20))
    health = Column(types.String(20))
