# HLDS servers

[![Docker Image CI](https://github.com/unixs/hlds-servers/actions/workflows/docker-image.yml/badge.svg)](https://github.com/unixs/hlds-servers/actions/workflows/docker-image.yml)

Half-Life dedicated server images

## General

### Base

It is clear Ubuntu system with general deps, steam app and latest server.

```bash
docker build -t unixs/steam:base -f docker/base.dockerfile docker/hlds
```

## Game images with specific args

### `private` (private server)

It is sample of private (password secured) server.

```bash
docker build -t unixs/steam:private -f docker/private.dockerfile docker/hlds
```

### `open` (public server)

It is sample of open public server.

```bash
docker build -t unixs/steam:open -f docker/open.dockerfile docker/hlds
```

### `rats` (public server)

It is server with mapcycle of rats-like maps.

```bash
docker build -t unixs/steam:rats -f docker/rats.dockerfile docker/hlds
```

### `private-hltv` (public server)

It is sample of public HLTV server.

```bash
docker build -t unixs/steam:private-hltv -f docker/private-hltv.dockerfile docker/hlds
```

## Run on host

See compose file for example
https://github.com/unixs/hlds-servers/blob/master/docker-compose.yml

Just start container with own options.

```bash
# open
docker run -d --restart=always -h hlds-open.example.net --name hlds-open --net host -e RCON_PASS=12345 unixs/steam:open

# private
docker run -d --restart=always -h hlds-private.example.net --name hlds-private --net host -e RCON_PASS=12345 -e SV_PASS=12345 unixs/steam:private

# hltv
docker run -d --restart=always -h private-hltv.example.net --name hltv-private --net host -e SRV_HOST=123.75.156.137 unixs/steam:private-hltv
```
ok
