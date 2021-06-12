readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL <<< "$(envsubst < init/initialize-database.sql)"

  local -r DB_SQL_FILE=init/db.sql.generated
  docker run --rm guacamole/guacamole:1.2.0 /opt/guacamole/bin/initdb.sh --mysql > $DB_SQL_FILE
  $MYSQL $DB_DATABASE < $DB_SQL_FILE
  rm --force $DB_SQL_FILE
  echo ...database initialized
}

initialize_guacamole() {
  echo Initializing Guacamole...
  (cd init && bash initialize-guacamole.sh)
  echo ...Guacamole initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --publish 8085:8080 \
    --env GUACD_HOSTNAME=guacamole-backend.backpack.test \
    --env GUACD_PORT=4822 \
    --env MYSQL_HOSTNAME=$DB_HOST \
    --env MYSQL_PORT=$DB_PORT \
    --env MYSQL_DATABASE=$DB_DATABASE \
    --env MYSQL_USER=$DB_USERNAME \
    --env MYSQL_PASSWORD=$DB_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
