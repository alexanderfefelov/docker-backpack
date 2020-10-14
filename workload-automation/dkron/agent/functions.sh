run_agent() {
  local -r CONTAINER_NAME=$1
  local -r HOST_NAME=$2

  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME \
      agent \
        --retry-join dkron-server-1.backpack.test:8901 \
        --retry-join dkron-server-2.backpack.test:8904 \
        --retry-interval 15s \
        --region test \
        --datacenter backpack \
        --tag group=agents \
        --tag host=$HOST_NAME \
        --data-dir /var/lib/dkron/data \
        --statsd-addr graphite-statsd.backpack.test:8125
}
