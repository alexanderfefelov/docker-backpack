print_container_info() {
  echo -e "\n$1"
  echo -e "\n\tIP address"
  docker inspect --format '{{printf "\t\t%s/%d" .NetworkSettings.IPAddress .NetworkSettings.IPPrefixLen}}' $1
  echo -e "\n\tPorts"
  docker inspect --format '{{range $key, $value := .NetworkSettings.Ports }}{{printf "\t\t"}}{{if $value}}{{printf "%s:%s" (index $value 0).HostIp (index $value 0).HostPort}}{{else}}∅{{end}}{{printf " -> %s\n" $key}}{{end}}' $1
  echo -e "\tMounts"
  docker inspect --format '{{range $data := .Mounts }}{{printf "\t\t%s %s -> %s rw=%t\n" $data.Type $data.Source $data.Destination $data.RW}}{{end}}' $1
}

wait_for_all_container_ports() {
  docker run --rm --link $1:foobar martin/wait -t $2
}

wait_for_container_ports() {
  docker run --rm --link $1:foobar martin/wait -p $2 -t $3
}

check_containers() {
  local not_running=0
  for x in $1; do
    echo -n $x...
    id=$(docker ps --quiet --filter status=running --filter name=$x)
    if [ "$id" = "" ]; then
      ((not_running+=1))
      echo not running
    else
      echo running
    fi
  done
  return $not_running
}
