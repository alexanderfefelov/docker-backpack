#!/usr/bin/env bash

set -e

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. functions.sh

run_slave $BACKUP_CONTAINER_NAME $BACKUP_HOST_NAME $BACKUP_MYSQL_SERVER_ID $BACKUP_PORT $MASTER_PORT
echo $BACKUP_CONTAINER_NAME is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $BACKUP_CONTAINER_NAME)
