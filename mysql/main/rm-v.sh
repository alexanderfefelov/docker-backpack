#!/usr/bin/env bash

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker volume rm $MASTER_CONTAINER_NAME-data
docker volume rm $BACKUP_CONTAINER_NAME-data
docker volume rm $SLAVE_CONTAINER_NAME-data
