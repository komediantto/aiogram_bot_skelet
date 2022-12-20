FROM python:3.10 as base

WORKDIR /app/app/admin

RUN apt update
RUN apt install -y python3-pip
RUN pip install poetry

RUN poetry config virtualenvs.create false

ENV C_FORCE_ROOT=1

FROM base as dev

COPY ./app/app/admin/pyproject.toml ./app/app/admin/poetry.lock* /app/app/admin/

RUN poetry install --no-root
ENV C_FORCE_ROOT=1

COPY ./app/app/admin /app/app/admin

WORKDIR /app/app/admin

CMD flask --app app:secureApp --debug run --host=0.0.0.0 --port=80