#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../lib/lib.sh

readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  $MYSQL --execute="
    CREATE DATABASE $DB_DATABASE;
    CREATE USER IF NOT EXISTS '$DB_USERNAME'@'%' IDENTIFIED WITH mysql_native_password BY '$DB_PASSWORD';
    GRANT ALL ON $DB_DATABASE.* TO '$DB_USERNAME'@'%';
  "
  echo ...database initialized
}

initialize_mattermost() {
  # https://docs.mattermost.com/administration/command-line-tools.html

  echo Initializing Mattermost...
  docker exec --tty --interactive $CONTAINER_NAME bash -c '
    set -e

    echo Creating users...
    bin/mattermost user create --system_admin --email admin@backpack.test --username admin_iesheigichae --password "Vuachaeghiok(42)"
    bin/mattermost user create --system_admin --email script@backpack.test --username script_noosoochieza --password "7^iengoomoogieV"
    bin/mattermost user create --email user@backpack.test --username user_eequoocheshi --password "#phahA4iezahzo"
    bin/mattermost user create --email alertmanager@backpack.test --username alertmanager_miepuiyiolim --password "Kleophakoneil)0("
    bin/mattermost user create --email fastnetmon@backpack.test --username fastnetmon_taeyaiyohsho --password "8#Shioghaefeim"
    bin/mattermost user create --email kapacitor@backpack.test --username kapacitor_zoodiopishoo --password "woo~5raeBuothe"
    echo ...users created

    echo Creating and populating team...
    bin/mattermost team create --name backpack --display_name backpack
    bin/mattermost team add backpack \
      admin_iesheigichae \
      alertmanager_miepuiyiolim \
      fastnetmon_taeyaiyohsho \
      kapacitor_zoodiopishoo \
      script_noosoochieza \
      user_eequoocheshi
    echo ...team created and populated

    echo Creating and populating channels...
    bin/mattermost channel create --team backpack --name alerts --display_name alerts
    bin/mattermost channel add backpack:alerts \
      admin_iesheigichae \
      alertmanager_miepuiyiolim \
      fastnetmon_taeyaiyohsho \
      kapacitor_zoodiopishoo \
      script_noosoochieza \
      user_eequoocheshi
    bin/mattermost channel create --team backpack --name test --display_name test
    bin/mattermost channel add backpack:test \
      admin_iesheigichae \
      script_noosoochieza \
      user_eequoocheshi
    echo ...channels created and populated
  '
  echo ...Mattermost initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/mattermost/config \
    --volume $CONTAINER_NAME-data:/mattermost/data \
    --volume $CONTAINER_NAME-log:/mattermost/logs \
    --publish 8065:8065 \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME
}

$MYSQL --execute="use $DB_DATABASE;"
readonly USE_DB_RETCODE=$?

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

if [ "$USE_DB_RETCODE" -ne 0 ]; then
  readonly FIRST_RUN=true
  initialize_database
fi

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
if [ "$FIRST_RUN" == "true" ]; then
  initialize_mattermost
fi
print_container_info $CONTAINER_NAME
