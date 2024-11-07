FROM --platform=amd64 ubuntu:24.04 as os

ENV STEAM_USER=steam
ENV STEAM_HOME=/home/${STEAM_USER}
ENV STEAM_DIR=/home/${STEAM_USER}/Steam

RUN apt update &&\
  apt install -y software-properties-common &&\
  add-apt-repository -y multiverse &&\
  dpkg --add-architecture i386 &&\
  apt update &&\
  apt -y upgrade &&\
  apt -y install htop sudo mc lnav curl lib32gcc-s1 lib32stdc++6 &&\
  apt clean &&\
  useradd -ms /bin/bash steam &&\
  sudo -iu steam &&\
  mkdir ${STEAM_DIR} &&\
  chown -v ${STEAM_USER}:${STEAM_USER} ${STEAM_DIR}

USER ${STEAM_USER}
WORKDIR ${STEAM_DIR}


FROM os as steamcmd

ENV STEAM_DISTR="https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"

RUN curl -sqL ${STEAM_DISTR} | tar zxvf - &&\
  (./steamcmd.sh +quit) && \
  mkdir -p ${STEAM_HOME}/.steam && \
  ln -vs ${STEAM_DIR}/linux32 ${STEAM_HOME}/.steam/sdk32

ENV LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"
