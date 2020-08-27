print_container_info() {
  echo $1 is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1)
}

wait_for_all_container_ports() {
  docker run --rm --link $1:foobar martin/wait -t $2
}
