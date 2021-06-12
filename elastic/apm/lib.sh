run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/usr/share/apm-server \
    --publish 8200:8200 \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}

run_tests() {
  docker exec $CONTAINER_NAME /usr/share/apm-server/apm-server test config
  docker exec $CONTAINER_NAME /usr/share/apm-server/apm-server test output
}
