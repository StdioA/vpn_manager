#!/usr/bin/env bash
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
python manage.py migrate
python manage.py collectstatic --no-input
echo "import initial_permission; initial_permission.init(); exit();" | python manage.py shell
# python manage.py shell -c "import initial_permission; initial_permission.init(); exit();"
python manage.py runserver 0.0.0.0:8000
