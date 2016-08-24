#!/usr/bin/env bash
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
python2 manage.py migrate
python2 manage.py shell -c "import initial_permission; initial_permission.init()"
