FROM python:3.8-slim as base

WORKDIR /giropops-senhas

COPY giropops-senhas /giropops-senhas

FROM base as builder

RUN apt-get update && apt-get install -y \
    redis \
    && apt-get clean

RUN pip install -r requirements.txt

FROM builder as final

ENV ENV_VARIABLE_NAME=localhost

ENTRYPOINT ["flask"]
CMD ["run", "--host=0.0.0.0"]
