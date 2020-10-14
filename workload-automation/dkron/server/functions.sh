run_server() {
  local -r CONTAINER_NAME=$1
  local -r HOST_NAME=$2
  local -r HTTP_PORT=$3
  local -r SERF_PORT=$4
  local -r GRPC_PORT=$5
  local -r PEER=$6
  local -r BOOTSTRAP=$7

  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-backup:/var/lib/dkron/backup \
    --volume $CONTAINER_NAME-log:/var/log/dkron \
    --publish $HTTP_PORT:8080 \
    --publish $SERF_PORT:8946 \
    --publish $SERF_PORT:8946/udp \
    --publish $GRPC_PORT:6868 \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME \
      agent \
        --server \
        --join $PEER \
        --retry-interval 15s \
        $BOOTSTRAP \
        --region test \
        --datacenter backpack \
        --tag group=servers \
        --tag host=$HOST_NAME \
        --data-dir /var/lib/dkron/data \
        --statsd-addr graphite-statsd.backpack.test:8125 \
        --enable-prometheus
}

initialize_dkron() {
  echo Initializing Dkron...
  bash init/create-jobs.sh $SERVER_1_HOST_NAME
  bash init/create-jobs.sh $SERVER_2_HOST_NAME
  echo ...Dkron initialized
}
