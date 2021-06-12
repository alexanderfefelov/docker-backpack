run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/questdb/conf \
    --volume $CONTAINER_NAME-data:/questdb/db \
    --volume $CONTAINER_NAME-log:/questdb/log \
    --publish 8010:9000 \
    --publish 8011:9009 \
    --publish 8012:8812 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
