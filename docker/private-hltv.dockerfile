FROM unixs/steam:valve

COPY private/hltv-entrypoint.sh .

ENTRYPOINT [ "./hltv-entrypoint.sh" ]
