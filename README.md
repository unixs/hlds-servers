# hlds-servers
Half-Life dedicated servers

## Build steps

`ubuntu:2204 => steam:base`

```bash
docker build -t unixs/steam:base -f docker/base.dockerfile docker/hlds
```
