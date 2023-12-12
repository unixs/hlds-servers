FROM unixs/steam:config

ENTRYPOINT [ "./hlds_run" ]
CMD [ "+maxplayers", "5", "+map", "crossfire" ]
