FROM unixs/steam:base

ENTRYPOINT [ "./hlds_run", "+maxplayers", "7", "+map", "rats" ]
