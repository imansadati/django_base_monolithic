FROM python:3.12-slim-bullseye
LABEL authors="iman.3adati@gmail.com"

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1


COPY /requirements /requirements
COPY /scripts /scripts
COPY . /app

WORKDIR /app/src

EXPOSE 8000

RUN apt-get update && \
    pip install --upgrade pip && \
    apt-get install -y build-essential libpq-dev && \
    pip install -r /requirements/production.txt  && \
    # adduser --disabled-password --no-create-home app && \ 
    chmod -R +x /scripts 

# USER app

ENTRYPOINT ["/scripts/entrypoint.sh"]

CMD ["/scripts/start.sh"]