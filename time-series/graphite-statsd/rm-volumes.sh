#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $CONTAINER_NAME-conf-graphite
docker volume rm $CONTAINER_NAME-conf-logrotate
docker volume rm $CONTAINER_NAME-conf-nginx
docker volume rm $CONTAINER_NAME-conf-statsd
docker volume rm $CONTAINER_NAME-data-graphite
docker volume rm $CONTAINER_NAME-data-redis
docker volume rm $CONTAINER_NAME-graphite-custom-functions
docker volume rm $CONTAINER_NAME-log
