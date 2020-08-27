print_container_info() {
  echo $1
  echo -e "\tIP address\n$(docker inspect --format '{{printf "\t\t%s/%d" .NetworkSettings.IPAddress .NetworkSettings.IPPrefixLen}}' $1)"
  echo -e "\tPorts\n$(docker inspect --format '{{range $key, $value := .NetworkSettings.Ports }}{{printf "\t\t"}}{{if $value}}{{printf "%s:%s" (index $value 0).HostIp (index $value 0).HostPort}}{{else}}∅{{end}}{{printf " -> %s\n" $key}}{{end}}' $1)"
  echo -e "\tMounts\n$(docker inspect --format '{{range $data := .Mounts }}{{printf "\t\t%s %s -> %s rw=%t\n" $data.Type $data.Source $data.Destination $data.RW}}{{end}}' $1)"
}

wait_for_all_container_ports() {
  docker run --rm --link $1:foobar martin/wait -t $2
}

wait_for_container_ports() {
  docker run --rm --link $1:foobar martin/wait -p $2 -t $3
}
