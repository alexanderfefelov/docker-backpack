run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/data/db \
    --publish 27017:27017 \
    --env MONGO_INITDB_ROOT_USERNAME=$ADMIN_USERNAME \
    --env MONGO_INITDB_ROOT_PASSWORD=$ADMIN_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
