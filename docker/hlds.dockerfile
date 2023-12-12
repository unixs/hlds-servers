FROM unixs/steam:config

ENTRYPOINT [ "./hlds_run" ]
CMD [ "+maxplayers", "7", "+map", "rats", "+sv_password", "1555746" ]
