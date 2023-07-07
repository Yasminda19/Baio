#!/bin/bash

if [[ ${BAIO_ENV} == "production" ]]; then
    $PWD/.venv/bin/uvicorn app.main:app --host ${HOST:-0.0.0.0} --port ${PORT:-5000} --workers ${WORKERS:-4}
else
    $PWD/.venv/bin/uvicorn app.main:app --host ${HOST:-0.0.0.0} --port ${PORT:-5000} --reload
fi