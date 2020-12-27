#!/bin/sh

readonly MAIN_CLASS=net.minecraft.server.Main
readonly CLASSPATH=/server.jar
readonly AGENT="-javaagent:/jolokia/jolokia-jvm-1.6.2-agent.jar=config=/jolokia/jolokia.properties"
readonly MEMORY="-Xmx1g"

readonly JAVA_OPTIONS="
  $AGENT
  $MEMORY
  -classpath $CLASSPATH
"

cd $MINECRAFT_HOME
java $JAVA_OPTIONS $MAIN_CLASS
