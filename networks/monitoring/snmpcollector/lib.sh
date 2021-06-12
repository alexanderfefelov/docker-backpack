run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/opt/snmpcollector/conf \
    --volume $CONTAINER_NAME-data:/opt/snmpcollector/data \
    --volume $CONTAINER_NAME-log:/opt/snmpcollector/log \
    --publish 8093:8090 \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
