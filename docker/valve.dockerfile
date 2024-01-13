FROM unixs/steam:base

ENV STEAM_DISTR="https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"

RUN curl -sqL ${STEAM_DISTR} | tar zxvf - &&\
    (./steamcmd.sh +login anonymous +app_update 90 +quit || \
    ./steamcmd.sh +login anonymous +app_update 90 +quit)

WORKDIR ${STEAM_DIR}/steamapps/common/Half-Life
