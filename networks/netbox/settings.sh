readonly DEFAULT_VERSION=2.11.3
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=netbox
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_HOST=postgresql-main.backpack.test
readonly DB_PORT=5432
readonly DB_DATABASE=netbox
readonly DB_SYSTEM_DATABASE=postgres
readonly DB_ROOT_USERNAME=postgres_ibleabaldine
readonly DB_ROOT_PASSWORD=undestrokend
readonly DB_USERNAME=netbox_saengaejoola
readonly DB_PASSWORD=thiunahbeifo

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
