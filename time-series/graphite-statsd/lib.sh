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
    --volume $CONTAINER_NAME-conf-graphite:/opt/graphite/conf \
    --volume $CONTAINER_NAME-conf-logrotate:/etc/logrotate.d \
    --volume $CONTAINER_NAME-conf-nginx:/etc/nginx \
    --volume $CONTAINER_NAME-conf-statsd:/opt/statsd/config \
    --volume $CONTAINER_NAME-data-graphite:/opt/graphite/storage \
    --volume $CONTAINER_NAME-data-redis:/var/lib/redis \
    --volume $CONTAINER_NAME-graphite-custom-functions:/opt/graphite/webapp/graphite/functions/custom \
    --volume $CONTAINER_NAME-log:/var/log \
    --publish 81:8080 \
    --publish 82:80 \
    --publish 2003-2004:2003-2004 \
    --publish 2003:2003/udp \
    --publish 2023-2024:2023-2024 \
    --publish 8125:8125/udp \
    --publish 8126:8126 \
    --env GOCARBON=1 \
    --env GRAPHITE_CARBONLINK_HOSTS=127.0.0.1:7002:a \
    --env GRAPHITE_TIME_ZONE=Europe/Moscow \
    --env GRAPHITE_DATE_FORMAT=%d.%m \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
