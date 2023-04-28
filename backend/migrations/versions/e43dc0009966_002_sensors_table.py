"""002_sensors_table

Revision ID: e43dc0009966
Revises: 2733c2b2aecc
Create Date: 2023-04-28 05:44:50.225602

"""
from alembic import op
import sqlalchemy as sa

# revision identifiers, used by Alembic.
revision = 'e43dc0009966'
down_revision = '2733c2b2aecc'
branch_labels = None
depends_on = None


def upgrade() -> None:
    op.create_table(
        "sensors",
        sa.Column("id", sa.Integer(), autoincrement=True, nullable=False),
        sa.Column("address", sa.String(length=64), nullable=True),
        sa.Column("user_id", sa.Integer(), nullable=False),
        sa.PrimaryKeyConstraint("id", name=op.f("pk_sensors")),
        sa.UniqueConstraint("id", name=op.f("uq_sensors_id")),
        sa.UniqueConstraint("address", name=op.f("uq_sensors_address")),
        sa.ForeignKeyConstraint(["user_id"], ["users.id"],
                                name=op.f("fk_sensors_user_id_users")),
    )


def downgrade() -> None:
    op.drop_table("sensors")
