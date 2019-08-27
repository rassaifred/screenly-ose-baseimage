# FROM balenalib/%%BALENA_MACHINE_NAME%%-debian:jessie
# FROM balenalib/raspberrypi3-debian
# FROM balenalib/raspberrypi3-debian:jessie
# FROM debian:buster-slim
# FROM balenalib/raspberrypi3-debian:stretch-run-20190612

FROM balenalib/raspberrypi3-debian:jessie
MAINTAINER rassaifred

RUN [ "cross-build-start" ]


RUN apt-get update && \
    apt-get -y install \
        openssh-client \
        build-essential \
        curl \
        git-core \
        libffi-dev \
        libssl-dev \
        matchbox \
        net-tools \
        nginx-light \
        omxplayer \
        psmisc \
        python-dev \
        python-imaging \
        python-netifaces \
        python-simplejson \
        libraspberrypi0 \
        lsb-release \
        ifupdown \
        sqlite3 \
        uzbl \
        x11-xserver-utils \
        xserver-xorg && \
    apt-get clean

# Install Python requirements
ADD requirements.txt /tmp/requirements.txt
RUN curl -s https://bootstrap.pypa.io/get-pip.py | python && \
    pip install -r /tmp/requirements.txt

RUN [ "cross-build-end" ]