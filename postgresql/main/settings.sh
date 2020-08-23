readonly BASE_NAME=backpack-postgresql-main
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly POSTGRES_USERNAME=postgres_ibleabaldine
readonly POSTGRES_PASSWORD=undestrokend
readonly POSTGRES_DATABASE=postgres

. ../../common-settings/health.sh
. ../../common-settings/log.sh
