FROM unixs/steam:base

ENTRYPOINT [ "./hlds_run" ]
CMD [ "-console", "+port", "27016", "+maxplayers", "15", "+map", "rats" ]
