readonly CONTAINER_NAME=$1

docker exec --tty --interactive $CONTAINER_NAME bash -c '
  set -e
  cd /dist/buildomatic
  ./js-ant init-js-db-ce
  ./js-ant import-minimal-ce
'
