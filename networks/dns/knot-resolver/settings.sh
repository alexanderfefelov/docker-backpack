readonly DEFAULT_VERSION=5.3.2
export VERSION=${VERSION:-$DEFAULT_VERSION}
export RELEASE=${VERSION%-*}
export RELEASE_HASH=${VERSION#*-}

readonly MONIKER=knot-resolver
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
