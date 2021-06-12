run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/etc/samba \
    --volume $CONTAINER_NAME-data:/var/lib/samba \
    --volume $CONTAINER_NAME-log:/var/log/samba \
    --publish 139:139 \
    --publish 445:445 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
