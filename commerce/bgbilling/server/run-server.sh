#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh

readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...

  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL <<< "$(envsubst < init/initialize-database.sql)"

  # Skip the lines:
  #   CREATE DATABASE ...
  #   USE ...
  #   SET collation_connection ...
  # and drop the lines:
  #   GRANT ALL ...
  #   CREATE USER ...
  $MYSQL $DB_DATABASE <<< "$(tail --lines=+4 init/dump.$VERSION.sql | grep --extended-regexp --invert-match 'GRANT ALL|CREATE USER')"

  echo ...database initialized
}

execute_scripts() {
  echo Executing scripts from $1...
  for f in $1/*; do
    echo "$f"
    case $f in
      *.sql)
        $MYSQL $DB_DATABASE <<< "$(envsubst < "$f")"
        ;;
      *)
        echo skipped
        ;;
    esac
  done
  echo ...scripts from $1 executed
}

run() {
  docker run \
    --name $SERVER_CONTAINER_NAME \
    --hostname $SERVER_HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $SERVER_CONTAINER_NAME-data:/BGBillingServer/data \
    --volume $SERVER_CONTAINER_NAME-dyn:/BGBillingServer/dyn \
    --volume $SERVER_CONTAINER_NAME-log:/BGBillingServer/log \
    --volume $SERVER_CONTAINER_NAME-web:/BGBillingServer/webroot \
    --publish 8098:8080 \
    --publish 8098:2005/udp \
    --publish 8099:8778 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME-server:$VERSION
}

$MYSQL --execute="USE $DB_DATABASE;"
readonly USE_DB_RETCODE=$?

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

if [ "$USE_DB_RETCODE" -ne 0 ]; then
  initialize_database
  execute_scripts init/tune-database
  execute_scripts init/configure-accounts
fi

run
wait_for_all_container_ports $SERVER_CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $SERVER_CONTAINER_NAME
