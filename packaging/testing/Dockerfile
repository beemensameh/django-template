FROM python:3.12.3

ENV PYTHONUNBUFFERED 1

# For build the translate file
RUN apt update
RUN apt install gettext -y

COPY ./packaging/testing/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV DJANGO_SETTINGS_MODULE=config.settings
ENV UWSGI_WSGI_FILE=/src/config/wsgi.py UWSGI_HTTP=:8000 UWSGI_MASTER=1 UWSGI_WORKERS=2 UWSGI_THREADS=8 UWSGI_UID=1000 UWSGI_GID=2000 UWSGI_LAZY_APPS=1 UWSGI_WSGI_ENV_BEHAVIOR=holy

COPY requirements-dev.txt /requirements.txt
RUN pip install -r /requirements.txt

COPY src /src/
WORKDIR /src

RUN mkdir media && chmod 777 media && \
    mkdir static && chmod 777 static && \
    mkdir logging && chmod 777 logging

ENTRYPOINT ["/entrypoint.sh"]
