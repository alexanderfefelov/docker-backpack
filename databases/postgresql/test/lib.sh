run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/var/lib/postgresql/data \
    --publish 5433:5432 \
    --env POSTGRES_USER=$POSTGRES_USERNAME \
    --env POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
    --env POSTGRES_DB=$POSTGRES_DATABASE \
    --env HEALTHCHECK_USERNAME=$HEALTHCHECK_USERNAME \
    --env HEALTHCHECK_PASSWORD=$HEALTHCHECK_PASSWORD \
    --env TELEGRAF_USERNAME=$TELEGRAF_USERNAME \
    --env TELEGRAF_PASSWORD=$TELEGRAF_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
