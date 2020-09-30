readonly BASE_NAME=backpack-nav
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly DB_HOST=main.postgresql.backpack.test
readonly DB_DATABASE=nav
readonly DB_ROOT_USERNAME=postgres_ibleabaldine
readonly DB_ROOT_PASSWORD=undestrokend
readonly DB_USERNAME=nav_smarigarybol
readonly DB_PASSWORD=tateicenstop

export IMAGE_NAME
export NAV_VERSION=5.0.6

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
