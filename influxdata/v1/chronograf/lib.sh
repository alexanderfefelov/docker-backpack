run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/var/lib/chronograf \
    --volume $CONTAINER_NAME-shared:/usr/share/chronograf \
    --publish 8888:8888 \
    --env INFLUXDB_URL=http://influxdb.backpack.test:8086 \
    --env KAPACITOR_URL=http://kapacitor.backpack.test:9092 \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
