FROM balenalib/raspberrypi3-debian:jessie
MAINTAINER rassaifred

RUN apt-get update

# Install Python requirements
ADD requirements.txt /tmp/requirements.txt
RUN curl -s https://bootstrap.pypa.io/get-pip.py | python && \
    pip install --upgrade -r /tmp/requirements.txt
