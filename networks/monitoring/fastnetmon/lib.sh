readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL <<< "$(envsubst < init/initialize-database.sql)"
  echo ...database initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/fastnetmon/conf \
    --volume $CONTAINER_NAME-log:/fastnetmon/log \
    --volume $CONTAINER_NAME-log-attack:/var/log/fastnetmon_attacks \
    --volume $CONTAINER_NAME-scripts:/fastnetmon/scripts \
    --publish 2055:2055/udp \
    --env GRAPHITE_HOST=$GRAPHITE_HOST \
    --env GRAPHITE_PORT=$GRAPHITE_PORT \
    --env REDIS_HOST=$REDIS_HOST \
    --env REDIS_PORT=$REDIS_PORT \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
