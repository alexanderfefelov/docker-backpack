ARG VERSION

FROM plantuml/plantuml-server:jetty-v$VERSION

USER root

RUN unzip -qq webapps/ROOT.war -d webapps/ROOT \
  && rm --force webapps/ROOT.war

ADD container/ /

RUN chown --recursive jetty:jetty /var/lib/jetty

USER jetty
