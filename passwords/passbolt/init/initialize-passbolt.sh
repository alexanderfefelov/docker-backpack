readonly CONTAINER_NAME=$1

docker exec --tty --interactive $CONTAINER_NAME bash -c '
  set -e

  ./bin/cake passbolt install \
    --admin-first-name admin \
    --admin-last-name keu1kiedu4ur \
    --admin-username admin_keu1kiedu4ur@backpack.test
'
