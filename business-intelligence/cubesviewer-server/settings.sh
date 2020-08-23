readonly BASE_NAME=backpack-cubesviewer-server
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly DB_HOST=master.mysql.backpack.test
readonly DB_DATABASE=cubesviewer_server
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=cubesviewer_server_odogymahouli
readonly DB_PASSWORD=inceadeavoca

. ../../common-settings/health.sh
. ../../common-settings/log.sh
