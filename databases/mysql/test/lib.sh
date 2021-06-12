run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/etc/mysql \
    --volume $CONTAINER_NAME-data:/var/lib/mysql \
    --publish 3307:3306 \
    --env MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
    --env HEALTHCHECK_USERNAME=$HEALTHCHECK_USERNAME \
    --env HEALTHCHECK_PASSWORD=$HEALTHCHECK_PASSWORD \
    --env TELEGRAF_USERNAME=$TELEGRAF_USERNAME \
    --env TELEGRAF_PASSWORD=$TELEGRAF_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
