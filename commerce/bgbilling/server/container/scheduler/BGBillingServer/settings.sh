readonly STARTUP_CLASS=bitel.billing.server.TaskExecuter
readonly LISTENER_PORT=9066

readonly CLASSPATH=\
$APP_HOME:\
$APP_HOME/lib/custom/*:\
$APP_HOME/lib/ext/common/*:\
$APP_HOME/lib/ext/server/*:\
$APP_HOME/lib/common/*:\
$APP_HOME/lib/server/*

readonly AGENT="-javaagent:$APP_HOME/jolokia/jolokia-jvm-1.6.2-agent.jar=config=$APP_HOME/jolokia/jolokia.properties"
readonly LOG="
  -Dlog4j.configuration=$APP_HOME/data/log4j.xml
  -Dlog.dir.path=$APP_HOME/log/
  -Dlog.prefix=scheduler
"
readonly MEMORY="-Xmx500m"
readonly NETWORK="-Djava.net.preferIPv4Stack=true"

readonly JAVA_OPTIONS="
  -classpath $CLASSPATH
  $AGENT
  $LOG
  $MEMORY
  $NETWORK
"
