#FROM debian:stretch
#FROM balenalib/raspberrypi3-debian
FROM balenalib/raspberrypi3-debian:stretch-run-20190612
MAINTAINER rassaifred
#MAINTAINER Viktor Petersson <vpetersson@screenly.io>

RUN apt-get update && \
    apt-get -y install \
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