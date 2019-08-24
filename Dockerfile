FROM debian:buster-slim
# FROM balenalib/raspberrypi3-debian:jessie
MAINTAINER rassaifred


RUN apt-get update && \
    apt-get -y install \
        git && \
    apt-get clean

RUN git clone https://github.com/popcornmix/omxplayer.git

RUN cd omxplayer

CMD ["bash", "./prepare-native-raspbian.sh"]
CMD ["bash", "make ffmpeg"]
CMD ["bash", "make -j$(nproc)"]
CMD ["bash", "make install"]


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