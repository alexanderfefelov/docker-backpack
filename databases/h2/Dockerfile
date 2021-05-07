FROM openjdk:8u282-jre-slim

ARG VERSION

COPY container/ /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       curl `# For health checks` \
       netcat `# For health checks` \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && curl --silent https://repo1.maven.org/maven2/com/h2database/h2/$VERSION/h2-$VERSION.jar --output /h2/h2.jar \
  && mkdir --parents /data

CMD ["java", \
  "-javaagent:/h2/jolokia/jolokia-jvm-1.6.2-agent.jar=config=/h2/jolokia/jolokia.properties", \
  "-classpath", "/h2/h2.jar", \
  "org.h2.tools.Server", \
  "-baseDir", "/data", \
  "-tcp", "-tcpAllowOthers", \
  "-web", "-webAllowOthers", "-webAdminPassword", "aixa5iphi3ee" \
]
