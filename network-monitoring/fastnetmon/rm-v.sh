#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $CONTAINER_NAME-conf
docker volume rm $CONTAINER_NAME-log
docker volume rm $CONTAINER_NAME-log-attack
docker volume rm $CONTAINER_NAME-scripts
