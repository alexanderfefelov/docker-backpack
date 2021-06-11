run_instance() {
  local -r INSTANCE_CONTAINER_NAME=$1
  local -r INSTANCE_HOST_NAME=$2
  local -r INSTANCE_NODE_NAME=$3
  local -r INSTANCE_HTTP_PORT=$4
  local -r INSTANCE_TRANSPORT_PORT=$5

docker run \
    --name $INSTANCE_CONTAINER_NAME \
    --hostname $INSTANCE_HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $INSTANCE_CONTAINER_NAME-conf:/usr/share/elasticsearch/config \
    --volume $INSTANCE_CONTAINER_NAME-data:/usr/share/elasticsearch/data \
    --publish $INSTANCE_HTTP_PORT:9200 \
    --publish $INSTANCE_TRANSPORT_PORT:9300 \
    --env network.host=0.0.0.0 \
    --env discovery.type=single-node \
    --env cluster.name=elasticsearch.backpack.test \
    --env node.name=$INSTANCE_NODE_NAME \
    $([[ $SSE_SUPPORT != *sse4_2* ]] && echo --env xpack.ml.enabled=false && echo Machine Learning disabled >&2) \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
