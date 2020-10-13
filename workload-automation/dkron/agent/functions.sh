run_agent() {
  docker run \
    --name $1 \
    --hostname $2 \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME \
      agent \
        --retry-join dkron-server.backpack.test:8910 \
        --retry-interval 15s \
        --region test \
        --datacenter backpack \
        --tag host=$2 \
        --data-dir /var/lib/dkron/data \
        --statsd-addr graphite-statsd.backpack.test:8125
}
