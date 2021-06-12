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
  $MYSQL $DB_DATABASE <<< "$(tail --lines=+4 init/dump-$DDL_VERSION.sql | grep --extended-regexp --invert-match 'GRANT ALL|CREATE USER')"

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

run_server() {
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

run_scheduler() {
  docker run \
    --name $SCHEDULER_CONTAINER_NAME \
    --hostname $SCHEDULER_HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $SCHEDULER_CONTAINER_NAME-data:/BGBillingServer/data \
    --volume $SCHEDULER_CONTAINER_NAME-log:/BGBillingServer/log \
    --publish 8100:8778 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME-scheduler:$VERSION
}
