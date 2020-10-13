#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $SERVER_1_CONTAINER_NAME-backup
docker volume rm $SERVER_1_CONTAINER_NAME-log
docker volume rm $SERVER_2_CONTAINER_NAME-backup
docker volume rm $SERVER_2_CONTAINER_NAME-log
