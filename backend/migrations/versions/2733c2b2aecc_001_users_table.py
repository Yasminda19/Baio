"""001_users_table

Revision ID: 2733c2b2aecc
Revises: bdc7ebc5aa93
Create Date: 2023-04-28 05:37:56.864640

"""
from alembic import op
import sqlalchemy as sa

# revision identifiers, used by Alembic.
revision = '2733c2b2aecc'
down_revision = 'bdc7ebc5aa93'
branch_labels = None
depends_on = None


def upgrade() -> None:
    user_tbl = op.create_table(
        "users",
        sa.Column("id", sa.Integer(), autoincrement=True, nullable=False),
        sa.Column("username", sa.String(length=64), nullable=False),
        sa.Column("password", sa.String(length=64), nullable=True),
        sa.PrimaryKeyConstraint("id", name=op.f("pk_users")),
        sa.UniqueConstraint("id", name=op.f("uq_users_id")),
        sa.UniqueConstraint("username", name=op.f("uq_users_username")),
    )

    op.bulk_insert(user_tbl, [{
        "id": 1,
        "username": "admin",
        "password": "$2b$12$zS9wr9A3b7V8z8Aw2QN73.wJxKp5GwYwna3WjjWcxSp0fiUBSIKci",
    }])


def downgrade() -> None:
    op.drop_table("users")
