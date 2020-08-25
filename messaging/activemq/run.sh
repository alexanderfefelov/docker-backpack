#!/usr/bin/env bash

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/activemq/data \
    --publish 1883:1883 \
    --publish 5672:5672 \
    --publish 8161:8161 \
    --publish 61613:61613 \
    --publish 61614:61614 \
    --publish 61616:61616 \
    --health-cmd $HEALTH_CMD --health-start-period $HEALTH_START_PERIOD --health-interval $HEALTH_INTERVAL --health-timeout $HEALTH_TIMEOUT --health-retries $HEALTH_RETRIES \
    --log-opt max-size=$LOG_MAX_SIZE --log-opt max-file=$LOG_MAX_FILE \
    $IMAGE_NAME
  docker run --rm --link $CONTAINER_NAME:foobar martin/wait -t $WAIT_TIMEOUT
}

run
echo $CONTAINER_NAME is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_NAME)
