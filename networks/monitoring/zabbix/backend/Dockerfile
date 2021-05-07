ARG VERSION

FROM zabbix/zabbix-server-mysql:ubuntu-$VERSION

COPY container/ /

USER root

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER zabbix
