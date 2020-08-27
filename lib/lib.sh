print_container_info() {
  echo $1 is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1)
}
