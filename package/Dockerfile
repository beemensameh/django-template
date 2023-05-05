FROM python:3.11

ENV PYTHONUNBUFFERED 1

COPY requirements.txt /requirements.txt

RUN pip install --no-cache-dir -r /requirements.txt

COPY src /src/
COPY packaging/entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

WORKDIR /src

RUN mkdir media && chmod 777 media && \
    mkdir static && chmod 777 static

ENV DJANGO_SETTINGS_MODULE=config.settings
ENV UWSGI_WSGI_FILE=/src/config/wsgi.py UWSGI_HTTP=:8000 UWSGI_MASTER=1 UWSGI_WORKERS=2 UWSGI_THREADS=8 UWSGI_UID=1000 UWSGI_GID=2000 UWSGI_LAZY_APPS=1 UWSGI_WSGI_ENV_BEHAVIOR=holy

EXPOSE 9000
ENTRYPOINT ["/entrypoint.sh"]
