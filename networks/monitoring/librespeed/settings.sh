readonly DEFAULT_VERSION=1.1.1
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=librespeed
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=librespeed
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=librespeed_gohsotahleit
readonly DB_PASSWORD=thuchusohgie

. ../../../lib/settings/go.sh
. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh

readonly REQUIRED_CONTAINERS='
  backpack-mysql-main-master
'
