readonly DEFAULT_VERSION=2.0.0
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=portainer
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly ADMIN_USERNAME=admin
readonly ADMIN_PASSWORD=defulobitusc

. ../lib/settings/go.sh
. ../lib/settings/log.sh
