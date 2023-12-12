FROM unixs/steam:hlds-base

ENV STEAM_USER=steam

# RUN useradd -ms /bin/bash ${STEAM_USER}

USER ${STEAM_USER}

#RUN cd &&\
#    /usr/games/steamcmd +login anonymous +app_update 90 +quit

WORKDIR /home/${STEAM_USER}/Steam/steamapps/common/Half-Life

COPY server.cfg mapcycle.txt liquids.wad decals.wad valve/
COPY ./maps/. valve/maps/
COPY ./sound/. valve/sound/
COPY ./gfx/. valve/gfx/
COPY ./sprites/. valve/sprites/
