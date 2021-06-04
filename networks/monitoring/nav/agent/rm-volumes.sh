#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $CONTAINER_NAME-conf-nav
docker volume rm $CONTAINER_NAME-conf-supervisor
docker volume rm $CONTAINER_NAME-log-nav
docker volume rm $CONTAINER_NAME-log-supervisor
