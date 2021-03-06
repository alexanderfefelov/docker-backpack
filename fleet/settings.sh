readonly DEFAULT_VERSION=3.8.0
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=fleet
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=fleet
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=fleet_fiedabaetivu
readonly DB_PASSWORD=iengeemiutuw

. ../lib/settings/go.sh
. ../lib/settings/health.sh
. ../lib/settings/log.sh
