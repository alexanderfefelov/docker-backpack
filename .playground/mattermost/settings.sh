readonly BASE_NAME=backpack-mattermost
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

. ../../lib/settings/go.sh
. ../../lib/settings/health.sh
. ../../lib/settings/log.sh

readonly DB_HOST=master.mysql.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=mattermost
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=mattermost_fepheedooroh
readonly DB_PASSWORD=thohrawaenee
