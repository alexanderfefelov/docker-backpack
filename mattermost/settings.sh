readonly DEFAULT_VERSION=5.29.1
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=mattermost
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=1200

. ../lib/settings/go.sh
. ../lib/settings/health.sh
. ../lib/settings/log.sh

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=mattermost
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=mattermost_fepheedooroh
readonly DB_PASSWORD=thohrawaenee
