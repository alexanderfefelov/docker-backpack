run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/usr/share/logstash/config \
    --volume $CONTAINER_NAME-pipeline:/usr/share/logstash/pipelines \
    --publish 5514:5514 \
    --publish 5514:5514/udp \
    --publish 9600:9600 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
