readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL <<< "$(envsubst < init/initialize-database.sql)"
  echo ...database initialized
}

execute_scripts() {
  echo Executing scripts from $1...
  for f in $1/*; do
    echo "$f"
    case $f in
      *.sql)
        $MYSQL $DB_DATABASE <<< "$(cat "$f")"
        ;;
      *.sh)
        bash <<< "$(cat "$f")"
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
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/usr/src/redmine/config \
    --volume $CONTAINER_NAME-data:/usr/src/redmine/files \
    --publish 8095:3000 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
