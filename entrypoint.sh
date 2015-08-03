#!/bin/bash
set -e

# check for target dir
if [ ! -d /data ]; then
    echo "Don't forget to map your output folder to /data:" 2>&1
    echo '  docker run ... -v "$PWD:/data" ...' 2>&1
    exit 1
fi

cd /data

# use '-' as first argument to skip entrypoint
if [ "$1" == "-" ]; then
    shift
    exec "$@"
fi

# list all included templates
if [ "$1" == "ls" ]; then
    exec ls /usr/src/templates/
fi

# Default to django template from github
if [ $# -eq 0 ]; then
    set -- gh:helderco/django-template
fi

# attempt to use an included template
if [ ! -z $1 ] && [ -d "/usr/src/templates/$1" ]; then
    exec cookiecutter "/usr/src/templates/$@"
else
    # use image as a binary
    exec cookiecutter "$@"
fi
