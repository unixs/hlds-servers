FROM unixs/steam:base

COPY hlds.sh .

ENTRYPOINT [ "./hlds.sh" ]
