FROM --platform=amd64 ubuntu:22.04 as base

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


FROM base as valve

ENV STEAM_DISTR="https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"

RUN curl -sqL ${STEAM_DISTR} | tar zxvf - &&\
    (./steamcmd.sh +login anonymous +app_update 90 +quit || \
    ./steamcmd.sh +login anonymous +app_update 90 +quit)

ENV LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"

WORKDIR ${STEAM_DIR}/steamapps/common/Half-Life


FROM custom

# COPY server.cfg hltv.cfg mapcycle.txt motd.txt liquids.wad decals.wad valve/
# COPY ./maps/. valve/maps/
# COPY ./sound/. valve/sound/
# COPY ./gfx/. valve/gfx/
# COPY ./sprites/. valve/sprites/
# COPY ./models/. valve/models/

COPY . valve/


FROM valve as custom

ENV LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"

ENTRYPOINT [ "./hltv" ]
CMD [ "+connect", "5.75.161.137", "+exec", "hltv.cfg" ]
