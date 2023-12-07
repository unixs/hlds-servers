FROM unixs/steam:cmd

ENV STEAM_USER=steam

RUN useradd -ms /bin/bash ${STEAM_USER} &&\
    su ${STEAM_USER} && cd &&\
    /usr/games/steamcmd +login anonymous +app_update 90 +quit
