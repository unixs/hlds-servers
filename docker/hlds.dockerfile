FROM unixs/steam:valve-custom

ENTRYPOINT [ "./hlds_run", "+maxplayers", "7", "+map", "rats" ]
