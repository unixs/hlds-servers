FROM unixs/steam:base

ENV SERVER_MOD="rats"
ENV SERVER_NAME=">> HL1 fufel - ${SERVER_MOD} <<"
ENV TIMELIMIT=25
# ENV SW_PASSWORD=''
# ENV RCON_PASSWORD=''

RUN sed -i "s/%SERVER_NAME%/${SERVER_NAME}/" valve/server.cfg &&\
  sed -i "s/%TIMELIMIT%/${TIMELIMIT}/" valve/server.cfg &&\
  sed -i "/%SW_PASSWORD%/d" valve/server.cfg
#  sed -i "s/%RCON_PASSWORD%/${RCON_PASSWORD}/" valve/server.cfg

COPY ${SERVER_MOD}/mapcycle.txt ${SERVER_MOD}/motd.txt ./valve/
COPY ${SERVER_MOD}/entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]
