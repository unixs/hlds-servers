FROM unixs/steam:base

ENTRYPOINT [ "./hlds_run" ]
CMD [ "+maxplayers", "7", "+map", "rats" ]
