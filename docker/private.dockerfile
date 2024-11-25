FROM unixs/steam:valve

ENV SERVER_MOD="private"
ENV SERVER_NAME=">> HL1 fufel - ${SERVER_MOD} <<"
ENV TIMELIMIT=20
# ENV SW_PASSWORD=''
# ENV RCON_PASSWORD=''

COPY ${SERVER_MOD}/mapcycle.txt ${SERVER_MOD}/motd.txt ./valve/
COPY ${SERVER_MOD}/entrypoint.sh .

RUN sed -i "s/%SERVER_NAME%/${SERVER_NAME}/" valve/server.cfg &&\
  sed -i "s/%TIMELIMIT%/${TIMELIMIT}/" valve/server.cfg &&\
  sed -i "s/%TIMELIMIT%/${TIMELIMIT}/" valve/motd.txt
#  sed -i "s/%SW_PASSWORD%/${SW_PASSWORD}/" valve/server.cfg &&\
#  sed -i "s/%RCON_PASSWORD%/${RCON_PASSWORD}/" valve/server.cfg

ENTRYPOINT [ "./entrypoint.sh" ]
