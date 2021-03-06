#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $CONTAINER_NAME-keystore
docker volume rm $CONTAINER_NAME-log-jasperreports
docker volume rm $CONTAINER_NAME-log-tomcat
