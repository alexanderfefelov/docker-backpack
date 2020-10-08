run_master() {
  docker run \
    --name $1 \
    --hostname $2 \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $1-conf:/etc/mysql \
    --volume $1-data:/var/lib/mysql \
    --publish $4:3306 \
    --env SERVER_ID=$3 \
    --env MODE=master \
    --env MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
    --env REPLICATOR_USERNAME=$REPLICATOR_USERNAME \
    --env REPLICATOR_PASSWORD=$REPLICATOR_PASSWORD \
    --env HEALTHCHECK_USERNAME=$HEALTHCHECK_USERNAME \
    --env HEALTHCHECK_PASSWORD=$HEALTHCHECK_PASSWORD \
    --env BACKUP_USERNAME=$BACKUP_USERNAME \
    --env BACKUP_PASSWORD=$BACKUP_PASSWORD \
    --env TELEGRAF_USERNAME=$TELEGRAF_USERNAME \
    --env TELEGRAF_PASSWORD=$TELEGRAF_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME
}

run_slave() {
  docker run \
    --name $1 \
    --hostname $2 \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $1-conf:/etc/mysql \
    --volume $1-data:/var/lib/mysql \
    --publish $4:3306 \
    --env SERVER_ID=$3 \
    --env MODE=slave \
    --env MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
    --env MASTER_HOST=mysql-main-master.backpack.test \
    --env MASTER_PORT=$5 \
    --env REPLICATOR_USERNAME=$REPLICATOR_USERNAME \
    --env REPLICATOR_PASSWORD=$REPLICATOR_PASSWORD \
    --env HEALTHCHECK_USERNAME=$HEALTHCHECK_USERNAME \
    --env HEALTHCHECK_PASSWORD=$HEALTHCHECK_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME
}
