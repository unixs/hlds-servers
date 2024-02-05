# hlds-servers

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/unixs/steam?style=flat-square&cacheSeconds=36000)

Half-Life dedicated servers images

## Build steps

### Base

It is clear Ubuntu system with general deps.

```bash
docker build -t unixs/steam:base -f docker/base.dockerfile docker/hlds
```

## Game images with specific args

### `hlds` (private server)

It is sample of private (password secured) server.

```bash
docker build -t unixs/steam:hlds -f docker/hlds.dockerfile docker/hlds
```

### `hlds-open` (public server)

It is sample of public server.

```bash
docker build -t unixs/steam:hlds-open -f docker/hlds-open.dockerfile docker/hlds
```

### `hltv` (public server)

It is sample of public HLTV server.

```bash
docker build -t unixs/steam:hltv -f docker/hltv.dockerfile docker/hlds
```

## Run on host

Just start container with own options.

```bash
# hlds-open
docker run -d --restart=always -h hlds-open.example.net --name hlds-open --net host  unixs/steam:hlds-open

# hlds
docker run -d --restart=always -h hlds.example.net --name hlds --net host  unixs/steam:hlds +sv_password longsecurepassword

# hltv
docker run -d --restart=always -h hltv.example.net --name hltv --net host  unixs/steam:hltv
```
