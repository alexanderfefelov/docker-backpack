run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/data \
    --publish 8108:8108 \
    --env TYPESENSE_API_KEY=xa7AMod9quaopho0eiquaike9ATu5viWae2iequ7ch \
    --env TYPESENSE_DATA_DIR=/data \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
