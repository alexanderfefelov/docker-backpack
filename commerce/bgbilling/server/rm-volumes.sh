#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $SERVER_CONTAINER_NAME-data
docker volume rm $SERVER_CONTAINER_NAME-dyn
docker volume rm $SERVER_CONTAINER_NAME-log
docker volume rm $SERVER_CONTAINER_NAME-web
