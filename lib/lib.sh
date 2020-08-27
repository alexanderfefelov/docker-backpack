print_container_info() {
  echo $1
  echo -e "\tIP\t$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1)"
  echo -e "\tPorts\t$(docker inspect --format '{{ .NetworkSettings.Ports }}' $1)"
  echo -e "\tMounts\t$(docker inspect --format '{{ .Mounts }}' $1)"
}

wait_for_all_container_ports() {
  docker run --rm --link $1:foobar martin/wait -t $2
}

wait_for_container_ports() {
  docker run --rm --link $1:foobar martin/wait -p $2 -t $3
}
