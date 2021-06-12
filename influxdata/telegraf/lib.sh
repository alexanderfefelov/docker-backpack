run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --network host \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/etc/telegraf \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume /:/host:ro \
    --env HOST_ETC=/host/etc \
    --env HOST_PROC=/host/proc \
    --env HOST_RUN=/host/run \
    --env HOST_SYS=/host/sys \
    --env HOST_VAR=/host/var \
    --env HOST_MOUNT_PREFIX=/host \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
