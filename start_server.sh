#!/usr/bin/env bash
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
python manage.py migrate
python manage.py collecstatic --no-input
python manage.py shell -c "import initial_permission; initial_permission.init()"
python manage.py runserver 0.0.0.0:8000
