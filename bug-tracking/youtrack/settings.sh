readonly DEFAULT_VERSION=2021.2.19690
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=youtrack
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly HOST_PORT=8094
readonly WAIT_TIMEOUT=600

readonly CONFIG="
  -J-Ddisable.configuration.wizard.on.clean.install=true
  --listen-port=8080
  --base-url=http://$HOST_NAME:$HOST_PORT
  --root-user=admin_mahcaewaeth0
  --root-password=geeh2io1oquu
  --allow-anonymous-access=false
"

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
