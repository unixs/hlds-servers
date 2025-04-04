FROM unixs/steam:cmd


ENV GAME_ID=90

RUN (./steamcmd.sh +login anonymous +app_update ${GAME_ID} +quit || \
  ./steamcmd.sh +login anonymous +app_update ${GAME_ID} +quit) && \
  mkdir -p ${STEAM_HOME}/.steam && \
  ln -vs ${STEAM_DIR}/linux32 ${STEAM_HOME}/.steam/sdk32

WORKDIR ${STEAM_DIR}/steamapps/common/Half-Life

COPY ./data valve/

ENTRYPOINT [ "./hlds_run" ]
