run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-backup:/opt/youtrack/backups \
    --volume $CONTAINER_NAME-conf:/opt/youtrack/conf \
    --volume $CONTAINER_NAME-data:/opt/youtrack/data \
    --volume $CONTAINER_NAME-log:/opt/youtrack/logs \
    --publish $HOST_PORT:8080 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION $1
}
