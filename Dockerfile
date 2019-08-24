FROM debian:stretch
#FROM balenalib/raspberrypi3-debian
MAINTAINER rassaifred
#MAINTAINER Viktor Petersson <vpetersson@screenly.io>

RUN apt-get update && \
    apt-get -y install \
        build-essential \
        curl \
        ffmpeg \
        git-core \
        libffi-dev \
        libssl-dev \
        lsb-release \
        mplayer \
        net-tools \
        procps \
        python-dev \
        python-gobject \
        python-imaging \
        python-netifaces \
        python-simplejson \
        sqlite3 \
    && \
    apt-get clean

# Install Python requirements
ADD requirements.txt /tmp/requirements.txt
ADD requirements.dev.txt /tmp/requirements.dev.txt
RUN curl -s https://bootstrap.pypa.io/get-pip.py | python && \
    pip install -r /tmp/requirements.txt && \
    pip install -r /tmp/requirements.dev.txt