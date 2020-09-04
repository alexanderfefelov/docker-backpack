#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../lib/lib.sh

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-log-apache2:/var/log/apache2 \
    --volume $CONTAINER_NAME-log-cron:/var/log/cron \
    --volume $CONTAINER_NAME-log-nav:/var/log/nav \
    --volume $CONTAINER_NAME-log-supervisor:/var/log/supervisor \
    --publish 83:80 \
    --publish 162:162/udp \
    --env PGHOST=$DB_HOST \
    --env PGDATABASE=$DB_DATABASE \
    --env PGUSER=$DB_ROOT_USERNAME \
    --env PGPASSWORD=$DB_ROOT_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME
}

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
