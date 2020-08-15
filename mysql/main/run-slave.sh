#!/usr/bin/env bash

set -e

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. functions.sh

run_slave $SLAVE_CONTAINER_NAME $SLAVE_HOST_NAME $SLAVE_MYSQL_SERVER_ID
docker inspect --format '{{ .NetworkSettings.IPAddress }}' $SLAVE_CONTAINER_NAME
