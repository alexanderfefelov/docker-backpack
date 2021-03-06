readonly DEFAULT_VERSION=1.3.0
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=guacamole-frontend
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=guacamole
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=guacamole_peoghonahmoh
readonly DB_PASSWORD=gechaegiezav

readonly REQUIRED_CONTAINERS='
  backpack-guacamole-backend
  backpack-mysql-main-master
'
