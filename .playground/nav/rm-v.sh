#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $CONTAINER_NAME-log-apache2
docker volume rm $CONTAINER_NAME-log-nav
docker volume rm $CONTAINER_NAME-log-supervisor
