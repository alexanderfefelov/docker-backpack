readonly DEFAULT_VERSION=4.16.1
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=diun
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test

. ../../lib/settings/go.sh
. ../../lib/settings/log.sh
