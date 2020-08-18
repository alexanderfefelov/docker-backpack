#!/usr/bin/env bash

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

readonly MYSQL="mysql --host=$DB_HOST --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  $MYSQL --execute=" \
    CREATE DATABASE $DB_DATABASE; \
    CREATE USER '$DB_GRAFANA_USERNAME'@'%' IDENTIFIED WITH mysql_native_password BY '$DB_GRAFANA_PASSWORD'; \
    GRANT ALL ON $DB_DATABASE.* TO '$DB_GRAFANA_USERNAME'@'%'; \
  "
  echo ...database initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/var/lib/grafana \
    --publish 3000:3000 \
    --env GOGC=$GO_GOGC --env GOMAXPROCS=$GO_GOMAXPROCS \
    --health-cmd $HEALTH_CMD --health-start-period $HEALTH_START_PERIOD --health-interval $HEALTH_INTERVAL --health-timeout $HEALTH_TIMEOUT --health-retries $HEALTH_RETRIES \
    --log-opt max-size=$LOG_MAX_SIZE --log-opt max-file=$LOG_MAX_FILE \
    $IMAGE_NAME
  docker run --rm --link $CONTAINER_NAME:foobar martin/wait -t $WAIT_TIMEOUT
}

$MYSQL --execute="use $DB_DATABASE;"
if [ $? -ne 0 ]; then
  initialize_database
fi

run
echo $CONTAINER_NAME is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_NAME)
