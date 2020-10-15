run_server() {
  local -r CONTAINER_NAME=$1
  local -r HOST_NAME=$2
  local -r NODE_NAME=$3
  local -r HTTP_PORT=$4
  local -r SERF_PORT=$5
  local -r GRPC_PORT=$6
  local -r PEER=$7
  local -r BOOTSTRAP=$8

  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-backup:/var/lib/dkron/backup \
    --volume $CONTAINER_NAME-data:/var/lib/dkron/data \
    --volume $CONTAINER_NAME-log:/var/log/dkron \
    --publish $HTTP_PORT:8080 \
    --publish $SERF_PORT:$SERF_PORT \
    --publish $SERF_PORT:$SERF_PORT/udp \
    --publish $GRPC_PORT:$GRPC_PORT \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME \
      agent \
        --server \
        --bind-addr $HOST_NAME:$SERF_PORT \
        --rpc-port $GRPC_PORT \
        --retry-join $PEER \
        --retry-interval 15s \
        $BOOTSTRAP \
        --region test \
        --datacenter backpack \
        --node-name $NODE_NAME \
        --tag group=servers \
        --tag host=$HOST_NAME \
        --data-dir /var/lib/dkron/data \
        --statsd-addr graphite-statsd.backpack.test:8125 \
        --enable-prometheus
}

initialize_dkron() {
  echo Initializing Dkron...
  bash init/create-server-jobs.sh $SERVER_1_HOST_NAME
  bash init/create-server-jobs.sh $SERVER_2_HOST_NAME
  echo ...Dkron initialized
}
