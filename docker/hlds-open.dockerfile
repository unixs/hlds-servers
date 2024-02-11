FROM unixs/steam:base

COPY hlds-open.sh .

ENTRYPOINT [ "./hlds-open.sh" ]
