readonly DEFAULT_VERSION=3.4.0
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=rundeck
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_DRIVER=com.mysql.cj.jdbc.Driver
readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=rundeck
readonly DB_URL=jdbc:mysql://$DB_HOST:$DB_PORT/$DB_DATABASE?serverTimezone=Europe/Moscow
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=rundeck_bineurvendle
readonly DB_PASSWORD=nocionersava

readonly PRIMARY_SERVER_ID=1b6eeef2-ecca-11ea-adc1-0242ac120002

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh

readonly REQUIRED_CONTAINERS='
  backpack-mysql-main-master
'
