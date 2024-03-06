FROM unixs/steam:base

ENV SERVER_NAME=">> HL1 fufel <<"
ENV TIMELIMIT=20
# ENV SW_PASSWORD=''
# ENV RCON_PASSWORD=''

RUN sed -i "s/%SERVER_NAME%/${SERVER_NAME}/" valve/server.cfg &&\
  sed -i "s/%TIMELIMIT%/${TIMELIMIT}/" valve/server.cfg
#  sed -i "s/%SW_PASSWORD%/${SW_PASSWORD}/" valve/server.cfg &&\
#  sed -i "s/%RCON_PASSWORD%/${RCON_PASSWORD}/" valve/server.cfg

COPY private/mapcycle.txt private/motd.txt ./valve/
COPY private/entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]
