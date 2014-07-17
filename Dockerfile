FROM ubuntu:14.04

RUN apt-get update
RUN apt-get upgrade -yq

RUN apt-get install -yq \
    python \
    python-dev \
    python-distribute \
    python-pip \
    python-virtualenv \
RUN virtualenv /venv
WORKDIR /flaskapp

ADD . /flaskapp

RUN /venv/bin/pip install -r requirements/dev.txt

ENV MYFLASKAPP_SECRET 'something-really-secret'
CMD ["/venv/bin/python", "manage.py", "server", "-h", "0.0.0.0"]

