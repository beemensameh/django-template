#!/bin/bash

# migrate any changes to the database container
python /src/manage.py migrate --noinput
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

# load data if LOAD_DATA is on
if [ "$LOAD_DATA" = "true" ]; then
    python /src/manage.py loaddata /src/*/fixtures/*.json
fi

# python /src/manage.py compilemessages

# collect static files
find . -name '*.pyc' -delete && python /src/manage.py collectstatic --noinput

uwsgi --http-auto-chunked --http-keepalive --static-map /static=/src/static --static-map /media=/src/media
