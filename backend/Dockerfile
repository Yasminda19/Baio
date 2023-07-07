FROM python:3.9 AS builder

WORKDIR /srv

COPY requirements.txt .
RUN python -m venv .venv \
        && .venv/bin/pip install -r requirements.txt

FROM python:3.9-slim

WORKDIR /srv

COPY --from=builder /srv/ /srv/

COPY abi.json /srv/abi.json
COPY alembic.ini /srv/alembic.ini
COPY migrations/ /srv/migrations/
COPY app/ /srv/app/
COPY start.sh /srv/start.sh

RUN chmod +x start.sh

CMD ["./start.sh"]