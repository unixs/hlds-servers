#!/usr/bin/env bash

set -e

cd ~/hl
docker compose ls
docker compose pull
docker compose stop
docker compose rm -f
docker compose up -d
docker compose ls
docker image prune -f
