FROM ubuntu:20.04

ARG VERSION
ARG MATTERMOST_STUFF=mattermost-team-$VERSION-linux-amd64.tar.gz
ENV MATTERMOST_HOME=/mattermost MATTERMOST_USER=mattermost MATTERMOST_GROUP=mattermost

ADD https://releases.mattermost.com/$VERSION/$MATTERMOST_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       ca-certificates \
       curl `# For health checks` \
  && tar --extract --gzip --file=$MATTERMOST_STUFF \
  && useradd $MATTERMOST_USER --no-create-home \
  && mkdir --parents $MATTERMOST_HOME/data \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force /$MATTERMOST_STUFF

COPY container/ /

RUN chown --recursive $MATTERMOST_USER:$MATTERMOST_GROUP $MATTERMOST_HOME

USER $MATTERMOST_USER
WORKDIR $MATTERMOST_HOME

CMD ["bin/mattermost"]
