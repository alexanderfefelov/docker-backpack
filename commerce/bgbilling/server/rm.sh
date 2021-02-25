#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker rm --force --volumes $SCHEDULER_CONTAINER_NAME
docker rm --force --volumes $SERVER_CONTAINER_NAME
