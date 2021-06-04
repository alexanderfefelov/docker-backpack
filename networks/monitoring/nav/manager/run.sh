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
    --volume $CONTAINER_NAME-conf-nav:/etc/nav \
    --volume $CONTAINER_NAME-conf-supervisor:/etc/supervisor \
    --volume $CONTAINER_NAME-crontab:/var/spool/cron/crontabs \
    --volume $CONTAINER_NAME-data-nav:/var/lib/nav \
    --volume $CONTAINER_NAME-log-apache2:/var/log/apache2 \
    --volume $CONTAINER_NAME-log-cron:/var/log/cron \
    --volume $CONTAINER_NAME-log-exim4:/var/log/exim4 \
    --volume $CONTAINER_NAME-log-nav:/var/log/nav \
    --volume $CONTAINER_NAME-log-rsyslog:/var/log/rsyslog \
    --volume $CONTAINER_NAME-log-supervisor:/var/log/supervisor \
    --volume $CONTAINER_NAME-mail:/var/spool/mail \
    --publish 83:80 \
    --publish 162:162/udp \
    --publish 9001:9001 \
    --env PGHOST=$DB_HOST \
    --env PGPORT=$DB_PORT \
    --env PGDATABASE=$DB_DATABASE \
    --env PGUSER=$DB_ROOT_USERNAME \
    --env PGPASSWORD=$DB_ROOT_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION-$ADD_ONS_VERSION
}

check_containers "$REQUIRED_CONTAINERS"
run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
