readonly DEFAULT_VERSION=3.1.0
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=passbolt
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=passbolt
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=passbolt_voo6puugeek2
readonly DB_PASSWORD=go0hi7vofiet

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
