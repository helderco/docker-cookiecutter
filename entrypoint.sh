#!/bin/bash
set -e

# check for target dir
if [ ! -d /data ]; then
    echo "Don't forget to map your output folder to /data:" 2>&1
    echo '  docker run ... -v "$PWD:/data" ...' 2>&1
    exit 1
fi

cd /data

# map user to volume owner
. "/mapuid.sh"

# use '-' as first argument to skip entrypoint
if [ "$1" == "-" ]; then
    shift
    exec "$@"
fi

# Default to django template from github
if [ $# -eq 0 ]; then
    set -- gh:helderco/django-template
fi

exec gosu python cookiecutter "$@"
