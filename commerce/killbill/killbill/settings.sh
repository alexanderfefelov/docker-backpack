readonly DEFAULT_VERSION=0.22.20
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=killbill
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=killbill
readonly DB_URL=jdbc:mysql://$DB_HOST:$DB_PORT/$DB_DATABASE
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=killbill_shiezouceeng
readonly DB_PASSWORD=aghahticeiri

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
