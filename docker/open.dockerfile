FROM unixs/steam:base

ENV SERVER_NAME=""

RUN sed
COPY private/entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]
