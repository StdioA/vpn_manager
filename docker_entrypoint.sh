#!/bin/bash
python manage.py migrate
python manage.py collectstatic --noinput
python manage.py initial_permission

touch /data/logs/gunicorn.log
touch /data/logs/access.log
tail -n 0 -f /data/logs/*.log &

# Start Gunicorn processes
echo Starting Gunicorn.
exec gunicorn vpn_manager.wsgi:application \
    --name hello_django \
    --bind 0.0.0.0:8000 \
    --workers 3 \
    --log-level=info \
    --log-file=/data/logs/gunicorn.log \
    --access-logfile=/data/logs/access.log \
    "$@"
