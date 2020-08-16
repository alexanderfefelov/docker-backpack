readonly BASE_NAME=backpack-grafana
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

. ../common-settings/go.sh
. ../common-settings/health.sh
. ../common-settings/log.sh

DB_HOST=master.mysql.backpack.test
DB_DATABASE=grafana
DB_ROOT_USERNAME=root
DB_ROOT_PASSWORD=camycorymicu
DB_GRAFANA_USERNAME=grafana_solenstgalog
DB_GRAFANA_PASSWORD=peritypindol
