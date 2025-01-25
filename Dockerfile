# for more detail about this base image: https://hub.docker.com/r/imansadatii/python-base
FROM imansadatii/python-base:1.0

WORKDIR /app/src

COPY /requirements/ /app/requirements/
COPY /scripts /app/scripts/

RUN pip install -r /app/requirements/production.txt && \ 
    adduser --disabled-password --no-create-home app && \
    mkdir -p /app/src/static /app/src/media && \
    chown -R app:app /app/src/static /app/src/media

USER app 

COPY . /app/

EXPOSE 8000

ENTRYPOINT ["check_postgres.sh"]

CMD ["/app/scripts/start.sh"]
