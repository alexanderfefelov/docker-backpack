#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $CONTAINER_NAME-data
docker volume rm $CONTAINER_NAME-dyn
docker volume rm $CONTAINER_NAME-log
docker volume rm $CONTAINER_NAME-web
