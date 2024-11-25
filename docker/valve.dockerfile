FROM unixs/steam:cmd


ENV GAME_ID=90

RUN (./steamcmd.sh +login anonymous +app_update ${GAME_ID} +quit || \
  ./steamcmd.sh +login anonymous +app_update ${GAME_ID} +quit) && \
  mkdir -p ${STEAM_HOME}/.steam && \
  ln -vs ${STEAM_DIR}/linux32 ${STEAM_HOME}/.steam/sdk32

COPY ./data valve/

WORKDIR ${STEAM_DIR}/steamapps/common/Half-Life

ENTRYPOINT [ "./hlds_run" ]
