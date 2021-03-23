#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $CONTAINER_NAME-conf
docker volume rm $CONTAINER_NAME-crontab
docker volume rm $CONTAINER_NAME-data
docker volume rm $CONTAINER_NAME-log-apache2
docker volume rm $CONTAINER_NAME-log-cron
docker volume rm $CONTAINER_NAME-log-nav
docker volume rm $CONTAINER_NAME-log-rsyslog
docker volume rm $CONTAINER_NAME-log-supervisor
