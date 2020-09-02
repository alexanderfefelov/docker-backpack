readonly BASE_NAME=backpack-rundeck
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly DB_DRIVER=com.mysql.cj.jdbc.Driver
readonly DB_HOST=master.mysql.backpack.test
readonly DB_DATABASE=rundeck
readonly DB_URL=jdbc:mysql://$DB_HOST/$DB_DATABASE?serverTimezone=Europe/Moscow
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=rundeck_bineurvendle
readonly DB_PASSWORD=nocionersava

. ../lib/settings/go.sh
. ../lib/settings/health.sh
. ../lib/settings/log.sh
