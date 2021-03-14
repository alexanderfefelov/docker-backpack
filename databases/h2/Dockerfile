FROM openjdk:8u282-jre-slim

ARG VERSION

ADD container/ /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       curl `# For health checks` \
       netcat `# For health checks` \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  &&  mkdir --parents /h2 /data

ADD http://maven.org/maven2/com/h2database/h2/$VERSION/h2-$VERSION.jar /h2/h2.jar

CMD ["java", "-classpath", "/h2/h2.jar", "org.h2.tools.Server", \
  "-baseDir", "/data", \
  "-tcp", "-tcpAllowOthers", \
  "-web", "-webAllowOthers", "-webAdminPassword", "aixa5iphi3ee" \
]
