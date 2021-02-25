readonly CLASSPATH=\
$APP_HOME:\
$APP_HOME/lib/custom/*:\
$APP_HOME/lib/ext/common/*:\
$APP_HOME/lib/ext/server/*:\
$APP_HOME/lib/common/*:\
$APP_HOME/lib/server/*

readonly JAVA_OPTIONS_COMMON="
  -classpath $CLASSPATH
"
