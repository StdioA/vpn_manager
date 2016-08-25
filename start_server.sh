#!/usr/bin/env bash
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
python manage.py migrate
python manage.py collectstatic --no-input
python manage.py initial_permission
python manage.py runserver 0.0.0.0:8000
