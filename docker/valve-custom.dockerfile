FROM unixs/steam:valve

# COPY server.cfg hltv.cfg mapcycle.txt motd.txt liquids.wad decals.wad valve/
# COPY ./maps/. valve/maps/
# COPY ./sound/. valve/sound/
# COPY ./gfx/. valve/gfx/
# COPY ./sprites/. valve/sprites/
# COPY ./models/. valve/models/

COPY . valve/