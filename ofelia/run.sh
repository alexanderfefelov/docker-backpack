#!/usr/bin/env bash

set -e

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume $CONTAINER_NAME-var:/ofelia/var \
    --env GOGC=$GO_GOGC --env GOMAXPROCS=$GO_GOMAXPROCS \
    --health-cmd /healthcheck.sh --health-start-period $HEALTH_START_PERIOD --health-interval $HEALTH_INTERVAL --health-timeout $HEALTH_TIMEOUT --health-retries $HEALTH_RETRIES \
    --log-opt max-size=$LOG_MAX_SIZE --log-opt max-file=$LOG_MAX_FILE \
    $IMAGE_NAME
}

run
echo $CONTAINER_NAME is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_NAME)
