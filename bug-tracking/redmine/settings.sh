readonly DEFAULT_VERSION=4.2.1
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=redmine
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=redmine
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=redmine_shaeM8oong9A
readonly DB_PASSWORD=ucapah7kai1I

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
