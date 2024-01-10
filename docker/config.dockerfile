FROM unixs/steam:hlds-base

ENV STEAM_USER=steam

USER ${STEAM_USER}

WORKDIR /home/${STEAM_USER}/Steam/steamapps/common/Half-Life

COPY server.cfg hltv.cfg mapcycle.txt motd.txt liquids.wad decals.wad valve/
COPY ./maps/. valve/maps/
COPY ./sound/. valve/sound/
COPY ./gfx/. valve/gfx/
COPY ./sprites/. valve/sprites/
COPY ./models/. valve/models/
