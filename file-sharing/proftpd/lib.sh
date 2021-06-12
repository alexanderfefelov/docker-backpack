run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/etc/proftpd \
    --volume $CONTAINER_NAME-data:/home \
    --volume $CONTAINER_NAME-log:/var/log/proftpd \
    --publish 20:20 \
    --publish 21:21 \
    --publish 65021-65042:65021-65042 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
