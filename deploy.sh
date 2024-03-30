#!/usr/bin/env bash

set -e

docker compose ls
docker compose -f servers.yml pull
docker compose -f servers.yml stop
docker compose -f servers.yml rm -f
docker compose -f servers.yml up -d
docker compose ls
docker image prune -f
