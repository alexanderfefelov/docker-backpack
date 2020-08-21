readonly BASE_NAME=backpack-metabase
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly DB_HOST=master.mysql.backpack.test
readonly DB_DATABASE=metabase
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=metabase_licideophaig
readonly DB_PASSWORD=msorphorylac

. ../../common-settings/health.sh
. ../../common-settings/log.sh
