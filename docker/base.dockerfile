FROM --platform=amd64 ubuntu:22.04

ENV STEAM_USER=steam
ENV STEAM_DIR=/home/${STEAM_USER}/Steam

RUN apt update &&\
    apt install -y software-properties-common &&\
    add-apt-repository -y multiverse &&\
    dpkg --add-architecture i386 &&\
    apt update &&\
    apt -y upgrade &&\
    apt -y install htop sudo mc lnav ruby wget curl lib32gcc-s1 lib32stdc++6 &&\
    apt clean &&\
    useradd -ms /bin/bash steam &&\
    sudo -iu steam &&\
    mkdir ${STEAM_DIR} &&\
    chown -v ${STEAM_USER}:${STEAM_USER} ${STEAM_DIR}

USER ${STEAM_USER}

WORKDIR ${STEAM_DIR}
