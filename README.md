# hlds-servers
Half-Life dedicated servers

## Build steps

### BASE

`ubuntu:2204 => steam:base`

```bash
docker build -t unixs/steam:base -f docker/base.dockerfile docker/hlds
```

### SteamCMD

`steam:base => steam:cmd`

#### On host

```bash
docker run -it --network host --name cmd unixs/steam:base

# Hack container here

docker commit cmd unixs/steam:cmd
```

#### Hack container

```bash
apt -y install steamcmd
# 2 - AGREE license
apt clean
```

### Install steam client and install server

`steam:cmd => steam:hlds-base`

#### On host

```bash
docker run -it --network host --name hlds-base unixs/steam:cmd

# Hack container here

docker commit hlds-base unixs/steam:hlds-base
```

#### Hack container

```bash
useradd -ms /bin/bash steam
su steam
cd
/usr/games/steamcmd +login anonymous +app_update 90 +quit
# wait while updating
```

### Build configured server image

`steam:hlds-base => steam:config`

```bash
docker build -t unixs/steam:config -f docker/config.dockerfile docker/hlds
```

### Build private server

`steam:hlds-base => steam:hlds`

### Build open server

`steam:hlds-base => steam:hlds-open`

### Build HLTV server

`steam:hlds-base => steam:hltv`
