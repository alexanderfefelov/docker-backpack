readonly DEFAULT_VERSION=2.0.2
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=cubes-frontend
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=cubesviewer_server
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=cubesviewer_server_odogymahouli
readonly DB_PASSWORD=inceadeavoca

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh

readonly REQUIRED_CONTAINERS='
  backpack-cubes-backend
  backpack-mysql-main-master
'
