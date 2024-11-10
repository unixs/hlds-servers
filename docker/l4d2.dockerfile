FROM unixs/steam:cmd

ENV GAME_ID=222860
ENV GAME_PORT=27020

RUN ./steamcmd.sh +login anonymous +app_update ${GAME_ID} +quit

WORKDIR ${STEAM_DIR}/steamapps/common/Left\ 4\ Dead\ 2\ Dedicated\ Server

COPY cfg/default.cfg cfg/server.cfg
COPY entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]
