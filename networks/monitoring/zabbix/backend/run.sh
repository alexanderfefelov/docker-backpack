#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../../../lib/lib.sh

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/etc/zabbix \
    --volume $CONTAINER_NAME-data:/var/lib/zabbix \
    --publish 10051:10051 \
    --env DB_SERVER_HOST=$DB_HOST \
    --env DB_SERVER_PORT=$DB_PORT \
    --env MYSQL_DATABASE=$DB_DATABASE \
    --env MYSQL_ROOT_PASSWORD=$DB_ROOT_PASSWORD \
    --env MYSQL_USER=$DB_USERNAME \
    --env MYSQL_PASSWORD=$DB_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}

check_containers "$REQUIRED_CONTAINERS"
run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
