run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/root/conf \
    --volume $CONTAINER_NAME-data:/root/var \
    --volume $CONTAINER_NAME-glowroot:/root/glowroot \
    --publish 25:25 \
    --publish 110:110 \
    --publish 143:143 \
    --publish 465:465 \
    --publish 587:587 \
    --publish 993:993 \
    --publish 8017:4000 \
    --publish 8016:8000 \
    --env GLOWROOT_ACTIVATED=true \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
