ARG VERSION

FROM jetbrains/youtrack:$VERSION

COPY container/ /

USER root

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       curl `# For health checks` \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER jetbrains
