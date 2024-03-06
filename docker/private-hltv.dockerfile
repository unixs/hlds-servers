FROM unixs/steam:base

COPY private/hltv-entrypoint.sh .

ENTRYPOINT [ "./hltv-entrypoint.sh" ]
