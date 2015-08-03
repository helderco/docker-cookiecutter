FROM python:2.7-slim
MAINTAINER Helder Correia <me@heldercorreia.com>

RUN apt-get update && \
    apt-get install git --no-install-recommends -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir cookiecutter

RUN mkdir -p /usr/src/templates
WORKDIR /usr/src/templates
RUN git clone https://github.com/helderco/django-template.git django

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
