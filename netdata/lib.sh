run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --restart unless-stopped \
    --cap-add SYS_PTRACE --security-opt apparmor=unconfined \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    --volume /etc/passwd:/host/etc/passwd:ro \
    --volume /etc/group:/host/etc/group:ro \
    --volume /proc:/host/proc:ro \
    --volume /sys:/host/sys:ro \
    --volume /etc/os-release:/host/etc/os-release:ro \
    --publish 19999:19999 \
    --env DOCKER_USR=root \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
