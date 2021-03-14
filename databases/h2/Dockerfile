FROM openjdk:8u282-jre-slim

ARG VERSION

RUN mkdir --parents /h2 /data

ADD http://maven.org/maven2/com/h2database/h2/$VERSION/h2-$VERSION.jar /h2/h2.jar

CMD ["java", "-classpath", "/h2/h2.jar", "org.h2.tools.Server", \
  "-baseDir", "/data", \
  "-tcp", "-tcpAllowOthers", \
  "-web", "-webAllowOthers", "-webAdminPassword", "aixa5iphi3ee" \
]
