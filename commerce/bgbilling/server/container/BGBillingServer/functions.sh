print_banner() {
  echo ------------------------------------------
  java -version
  echo APP_HOME: $APP_HOME
  echo CLASSPATH: $CLASSPATH
  echo JAVA_OPTIONS: $JAVA_OPTIONS
  echo STARTUP_CLASS: $STARTUP_CLASS
  echo ------------------------------------------
}
