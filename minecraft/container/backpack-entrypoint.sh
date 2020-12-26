#!/bin/sh

readonly AGENT="-javaagent:/jolokia/jolokia-jvm-1.6.2-agent.jar=config=/jolokia/jolokia.properties"
readonly MEMORY="-Xmx1g"

readonly JAVA_OPTIONS="
  $AGENT
  $MEMORY
"

cd $MINECRAFT_HOME
java $JAVA_OPTIONS -jar server.jar
