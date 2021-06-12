check_vm_max_map_count() {
  local -r PARAM=vm.max_map_count
  local -r REQUIRED_MIN=262144
  local -r CURRENT=$(sysctl $PARAM | awk '{ print $3 }')
  if [ $CURRENT -lt $REQUIRED_MIN ]; then
    echo Current value for $PARAM is $CURRENT, minimum required value is $REQUIRED_MIN >&2
    exit 1
  fi
}

readonly SSE_SUPPORT=$(cat /proc/cpuinfo | grep flags | grep --only-matching --word-regexp 'sse\S*' | sort | uniq | paste --delimiters=' ' --serial -)

print_sse_info() {
  echo Elasticsearch Machine Learning requires CPU with SSE4.2 support
  if [ -z "$SSE_SUPPORT" ]; then
    echo No SSE support detected
  else
    echo Detected CPU with support for $SSE_SUPPORT
  fi
}

initialize_elasticsearch() {
  if http --check-status GET http://$NODE_1_HOST_NAME:$NODE_1_HTTP_PORT --auth-type basic --auth installer_uru6oushi7oh:sohsah0oghat > /dev/null 2>&1; then
    echo Initializing Elasticsearch...
    bash init/configure-roles.sh
    bash init/configure-accounts.sh $CONTAINER_NAME
    echo ...Elasticsearch initialized
  fi
}

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
