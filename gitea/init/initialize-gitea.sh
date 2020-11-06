readonly CONTAINER_NAME=$1

# https://docs.gitea.io/en-us/command-line/
docker exec --tty --interactive $CONTAINER_NAME su git -c '
  set -e

  echo Creating users...

  gitea admin create-user \
    --admin \
    --email admin@backpack.test \
    --username admin_aizaitaepeeg \
    --password utaewainaeni

  gitea admin create-user \
    --email user@backpack.test \
    --username user_thiephahheib \
    --password ofioyoxethie

  echo ...users created
'
