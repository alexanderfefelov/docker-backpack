readonly DEFAULT_VERSION=8.2104-2105210307
readonly DDL_VERSION=8.2104-2105210307
export VERSION=${VERSION:-$DEFAULT_VERSION}
export RELEASE=${VERSION%-*}
export SET=${VERSION#*-}
export COMPONENTS='
  bill
  card
  inet
  mps
  npay
  reports
  rscm
  sorm
  subscription

  bonus
  cladr
  dispatch
  documents
  fias
  helpdesk
'

readonly MONIKER=bgbilling
readonly BASE_NAME=backpack-$MONIKER
export IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly SCHEDULER_CONTAINER_NAME=$BASE_NAME-scheduler
readonly SERVER_CONTAINER_NAME=$BASE_NAME-server
readonly SCHEDULER_HOST_NAME=$MONIKER-scheduler.backpack.test
readonly SERVER_HOST_NAME=$MONIKER-server.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=bgbilling
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=bgbilling_nah0queithei
readonly DB_PASSWORD=feizudi1xu9h

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh

readonly REQUIRED_CONTAINERS='
  backpack-activemq-node-1
  backpack-mysql-main-master
'
