#!/usr/bin/env bash

set -e

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. functions.sh

run_master $MASTER_CONTAINER_NAME $MASTER_HOST_NAME $MASTER_MYSQL_SERVER_ID $MASTER_PORT
echo $MASTER_CONTAINER_NAME is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $MASTER_CONTAINER_NAME)
