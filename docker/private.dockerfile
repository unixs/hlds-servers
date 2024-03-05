FROM unixs/steam:base

ENV SERVER_NAME=">> HL1 fufel <<"

# RUN sed
COPY private/entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]
