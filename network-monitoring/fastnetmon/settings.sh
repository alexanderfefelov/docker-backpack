readonly MONIKER=fastnetmon
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly GRAPHITE_HOST=influxdb.backpack.test
readonly GRAPHITE_PORT=2013
readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=fastnetmon
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=fastnetmon_boeweewoonee
readonly DB_PASSWORD=uheeghienoej

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
