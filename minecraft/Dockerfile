FROM quay.io/alexanderfefelov/graalvm:21.1.0-java8

ARG VERSION
ENV MINECRAFT_HOME=/minecraft

COPY container/ /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       ca-certificates \
       curl \
       jq \
       netcat `# For health checks` \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN /download-server.sh $VERSION /

CMD ["/backpack-entrypoint.sh"]
