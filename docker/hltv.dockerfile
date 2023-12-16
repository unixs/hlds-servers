FROM unixs/steam:config

ENV LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"

ENTRYPOINT [ "./hltv" ]
CMD [ "+connect", "5.75.161.137", "+exec", "hltv.cfg" ]
