FROM ubuntu:noble AS metamod

ARG METAMOD_ROOT=metamod-p
ARG METAMOD_REPO=https://github.com/Bots-United/${METAMOD_ROOT}.git

RUN apt update && apt upgrade -y && \
  apt install -y git mc build-essential gcc-multilib g++-multilib && \
  git clone ${METAMOD_REPO} && cd ${METAMOD_ROOT} && \
  make OPT=opt


FROM unixs/steam:cmd

ENV GAME_ID=90
ENV CDN_URL="https://cdn.fufel.net/"

ARG METAMOD_SO_PATH=addons/metamod/dlls/metamod.so


RUN (./steamcmd.sh +login anonymous +app_update ${GAME_ID} +quit || \
  ./steamcmd.sh +login anonymous +app_update ${GAME_ID} +quit) && \
  mkdir -p ${STEAM_HOME}/.steam && \
  ln -vs ${STEAM_DIR}/linux32 ${STEAM_HOME}/.steam/sdk32

WORKDIR ${STEAM_DIR}/steamapps/common/Half-Life

COPY ./data valve/
COPY --from=metamod metamod-p/metamod/opt.linux_i386/metamod.so valve/addons/metamod/dlls/
RUN sed -i "s|dlls/hl.so|${METAMOD_SO_PATH}|" valve/liblist.gam

ENTRYPOINT [ "./hlds_run" ]
