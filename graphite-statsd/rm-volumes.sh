#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $CONTAINER_NAME-graphite-conf
docker volume rm $CONTAINER_NAME-graphite-data
docker volume rm $CONTAINER_NAME-statsd-conf
docker volume rm $CONTAINER_NAME-log
