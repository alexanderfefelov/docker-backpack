readonly BASE_NAME=backpack-cubes-frontend
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly DB_HOST=master.mysql.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=cubesviewer_server
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=cubesviewer_server_odogymahouli
readonly DB_PASSWORD=inceadeavoca

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh