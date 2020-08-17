#!/usr/bin/env bash

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $CONTAINER_NAME-data-graphite
docker volume rm $CONTAINER_NAME-data-redis
docker volume rm $CONTAINER_NAME-log