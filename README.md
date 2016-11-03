# docker-cookiecutter

Cookiecutter templates in docker

## Usage

    alias cookiecutter='docker run -it --rm -v "$PWD:/data" helder/cookiecutter'

## Run another command in the container

Use the `-` argument to skip the cookiecutter entrypoint:

    $ cookiecutter - bash
