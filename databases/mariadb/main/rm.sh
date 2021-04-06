#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker rm --force --volumes $MASTER_CONTAINER_NAME
docker rm --force --volumes $BACKUP_CONTAINER_NAME
docker rm --force --volumes $SLAVE_CONTAINER_NAME
