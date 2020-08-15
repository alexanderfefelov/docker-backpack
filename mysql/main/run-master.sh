#!/usr/bin/env bash

set -e

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. functions.sh

run_master $MASTER_CONTAINER_NAME $MASTER_HOST_NAME $MASTER_MYSQL_SERVER_ID
docker inspect --format '{{ .NetworkSettings.IPAddress }}' $MASTER_CONTAINER_NAME
