#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $NODE_1_CONTAINER_NAME-conf
docker volume rm $NODE_1_CONTAINER_NAME-data
docker volume rm $NODE_2_CONTAINER_NAME-conf
docker volume rm $NODE_2_CONTAINER_NAME-data
docker volume rm $NODE_3_CONTAINER_NAME-conf
docker volume rm $NODE_3_CONTAINER_NAME-data
