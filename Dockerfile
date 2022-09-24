FROM python:3.9-slim AS base

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

# env
ENV VENV_PATH="/opt/venv"
ENV PATH="${VENV_PATH}/bin:${PATH}"

WORKDIR /app

COPY . /app

RUN python -m venv ${VENV_PATH} \
    &&  . /opt/venv/bin/activate \
    &&  pip install --upgrade pip \
    &&  pip install -r requirements.txt


FROM python:3.9-slim AS development


ENV VENV_PATH="/opt/venv"
ENV PATH="${VENV_PATH}/bin:${PATH}"

COPY . /app

COPY --from=base $VENV_PATH $VENV_PATH


WORKDIR /app

ENTRYPOINT [ "python3" ]

CMD [ "-m" , "flask", "run", "--host=0.0.0.0"]