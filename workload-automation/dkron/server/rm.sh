#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker rm --force --volumes $SERVER_1_CONTAINER_NAME
docker rm --force --volumes $SERVER_2_CONTAINER_NAME
