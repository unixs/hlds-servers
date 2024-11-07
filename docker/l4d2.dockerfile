FROM unixs/steam:cmd

ENV GAME_ID=222860
ENV GAME_PORT=27020

RUN ./steamcmd.sh +login anonymous +app_update ${GAME_ID}} +quit

ENTRYPOINT [ "./srcds_run" ]
