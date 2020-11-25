readonly CONTAINER_NAME=$1

docker exec --tty --interactive $CONTAINER_NAME sh -c '
  set -e

  fleetctl config set --address https://localhost:8080 --tls-skip-verify

  fleetctl setup \
    --email admin@backpack.test \
    --username admin_chaezaizoosh \
    --password xaexepaeyaif
'
