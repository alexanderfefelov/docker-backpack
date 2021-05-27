readonly DEFAULT_VERSION=5.1.2
export VERSION=${VERSION:-$DEFAULT_VERSION}
readonly DEFAULT_ADD_ONS_VERSION=4cddb2f
export ADD_ONS_VERSION=${ADD_ONS_VERSION:-$DEFAULT_ADD_ONS_VERSION}

readonly MONIKER=nav-agent
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_HOST=postgresql-main.backpack.test
readonly DB_PORT=5432
readonly DB_DATABASE=nav
readonly DB_USERNAME=nav_smarigarybol
readonly DB_PASSWORD=tateicenstop

. ../../../../lib/settings/health.sh
. ../../../../lib/settings/log.sh

readonly REQUIRED_CONTAINERS="
  backpack-graphite-statsd
  backpack-postgresql-main
"
