generate_config_files() {
  echo Generating config files...

  local -r IP_ADDRESS=$(ip route get 1.0.0.0 | awk '{ print $7 }')
  if [ -z $IP_ADDRESS ]; then
    echo Failed to detect IP address >&2
    exit 1
  fi
  export IP_ADDRESS
  envsubst \
    < build/template.hosts \
    > container/etc/coredns/hosts.generated

  echo ...config files generated
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/etc/coredns \
    --publish 53:53 \
    --publish 53:53/udp \
    --publish 9153:9153 \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
