#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

readonly MYSQL="mysql --host=$DB_HOST --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  $MYSQL --execute=" \
    CREATE DATABASE $DB_DATABASE; \
    CREATE USER '$DB_USERNAME'@'%' IDENTIFIED WITH mysql_native_password BY '$DB_PASSWORD'; \
    GRANT ALL ON $DB_DATABASE.* TO '$DB_USERNAME'@'%'; \
  "
  echo ...database initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/opt/graphite/storage \
    --volume $CONTAINER_NAME-log:/var/log \
    --publish 81:8080 \
    --publish 82:80 \
    --publish 2003-2004:2003-2004 \
    --publish 2023-2024:2023-2024 \
    --publish 8125:8125/udp \
    --publish 8126:8126 \
    "$DEFAULT_HEALTH_SETTINGS" \
    "$DEFAULT_LOG_SETTINGS" \
    $IMAGE_NAME
}

wait_for_ports() {
  docker run --rm --link $CONTAINER_NAME:foobar martin/wait -p 2003,8080 -t $WAIT_TIMEOUT
}

print_info() {
  echo $CONTAINER_NAME is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_NAME)
}

$MYSQL --execute="use $DB_DATABASE;"
if [ $? -ne 0 ]; then
  initialize_database
fi

run
wait_for_ports
print_info
