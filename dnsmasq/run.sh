#!/usr/bin/env bash

set -e

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --restart unless-stopped \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --publish 53:53/udp \
    --publish 5380:8080 \
    --env HTTP_USER=$ADMIN_USERNAME \
    --env HTTP_PASS=$ADMIN_PASSWORD \
    --health-cmd $HEALTH_CMD --health-start-period $HEALTH_START_PERIOD --health-interval $HEALTH_INTERVAL --health-timeout $HEALTH_TIMEOUT --health-retries $HEALTH_RETRIES \
    --log-opt max-size=$LOG_MAX_SIZE --log-opt max-file=$LOG_MAX_FILE \
    $IMAGE_NAME
  docker run --rm --link $CONTAINER_NAME:foobar martin/wait -t $WAIT_TIMEOUT
}

run
docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_NAME
