readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL <<< "$(envsubst < init/initialize-database.sql)"
  echo ...database initialized
}

initialize_migrations() {
  echo Initializing migrations...
  export DB_DATABASE
  $MYSQL <<< "$(envsubst < init/initialize-migrations.sql)"
  echo ...migrations initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --publish 8096:8080 \
    --volume $CONTAINER_NAME-log:/var/lib/tomcat/logs \
    --env KILLBILL_DAO_URL=$DB_URL \
    --env KILLBILL_DAO_USER=$DB_USERNAME \
    --env KILLBILL_DAO_PASSWORD=$DB_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
