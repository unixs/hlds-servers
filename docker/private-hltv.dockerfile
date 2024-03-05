FROM unixs/steam:base

ENV LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"

COPY hltv.sh .

ENTRYPOINT [ "./hltv.sh" ]
