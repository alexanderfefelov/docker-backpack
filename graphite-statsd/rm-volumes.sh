#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $CONTAINER_NAME-graphite-conf
docker volume rm $CONTAINER_NAME-graphite-custom-functions
docker volume rm $CONTAINER_NAME-graphite-data
docker volume rm $CONTAINER_NAME-logrotate-conf
docker volume rm $CONTAINER_NAME-nginx-conf
docker volume rm $CONTAINER_NAME-redis-data
docker volume rm $CONTAINER_NAME-statsd-conf
docker volume rm $CONTAINER_NAME-log
