run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf-nav:/etc/nav \
    --volume $CONTAINER_NAME-conf-supervisor:/etc/supervisor \
    --volume $CONTAINER_NAME-log-nav:/var/log/nav \
    --volume $CONTAINER_NAME-log-supervisor:/var/log/supervisor \
    --publish 9004:9001 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION-$ADD_ONS_VERSION
}
