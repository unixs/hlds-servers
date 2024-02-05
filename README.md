# hlds-servers

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/unixs/steam?style=flat-square&cacheSeconds=36000)


Half-Life dedicated servers images

## Build steps

### Base

It is clear Ubuntu system with general deps.

`ubuntu:22.04 => steam:base`

```bash
docker build -t unixs/steam:base -f docker/base.dockerfile docker/hlds
```

### Valve

It is steam cmd with valve hlds server.

`steam:base => steam:valve`

```bash
docker build -t unixs/steam:valve -f docker/valve.dockerfile docker/hlds
```

### Valve custom

It is valve hlds server with additional maps and settings.

`steam:valve => steam:valve-custom`

```bash
docker build -t unixs/steam:valve-custom -f docker/valve-custom.dockerfile docker/hlds
```

## Game images with specific args

### `hlds` (private server)

It is sample of private (password secured) server.

`steam:valve-custom => steam:hlds`

```bash
docker build -t unixs/steam:hlds -f docker/hlds.dockerfile docker/hlds
```

### `hlds-open` (public server)

It is sample of public server.

`steam:valve-custom => steam:hlds-open`

```bash
docker build -t unixs/steam:hlds-open -f docker/hlds-open.dockerfile docker/hlds
```

### `hltv` (public server)

It is sample of public HLTV server.

`steam:valve-custom => steam:hltv`

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
