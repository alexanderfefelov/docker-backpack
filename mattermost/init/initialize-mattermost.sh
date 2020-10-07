readonly CONTAINER_NAME=$1

# https://docs.mattermost.com/administration/command-line-tools.html
docker exec --tty --interactive $CONTAINER_NAME bash -c '
  set -e

  echo Creating users...

  bin/mattermost user create \
    --system_admin \
    --email admin@backpack.test \
    --username admin_iesheigichae \
    --password "Vuachaeghiok(42)" \
    --nickname Admin

  bin/mattermost user create \
    --system_admin \
    --email script@backpack.test \
    --username script_noosoochieza \
    --password "7^iengoomoogieV" \
    --nickname Script

  bin/mattermost user create \
    --email user@backpack.test \
    --username user_eequoocheshi \
    --password "#phahA4iezahzo" \
    --nickname User

  bin/mattermost user create \
    --email alertmanager@backpack.test \
    --username alertmanager_miepuiyiolim \
    --password "Kleophakoneil)0(" \
    --nickname Alertmanager

  bin/mattermost user create \
    --email fastnetmon@backpack.test \
    --username fastnetmon_taeyaiyohsho \
    --password "8#Shioghaefeim" \
    --nickname FastNetMon

  bin/mattermost user create \
    --email kapacitor@backpack.test \
    --username kapacitor_zoodiopishoo \
    --password "woo~5raeBuothe" \
    --nickname Kapacitor

  echo ...users created

  echo Creating and populating team...

  bin/mattermost team create \
    --name backpack \
    --display_name Backpack

  bin/mattermost team add backpack \
    admin_iesheigichae \
    alertmanager_miepuiyiolim \
    fastnetmon_taeyaiyohsho \
    kapacitor_zoodiopishoo \
    script_noosoochieza \
    user_eequoocheshi

  echo ...team created and populated

  echo Creating and populating channels...

  bin/mattermost channel create \
    --team backpack \
    --name alerts \
    --display_name Alerts

  bin/mattermost channel add backpack:alerts \
    admin_iesheigichae \
    alertmanager_miepuiyiolim \
    fastnetmon_taeyaiyohsho \
    kapacitor_zoodiopishoo \
    script_noosoochieza \
    user_eequoocheshi

  bin/mattermost channel create \
    --team backpack \
    --name test \
    --display_name Test

  bin/mattermost channel add backpack:test \
    admin_iesheigichae \
    script_noosoochieza \
    user_eequoocheshi

  echo ...channels created and populated
'
