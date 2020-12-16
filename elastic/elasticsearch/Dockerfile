ARG VERSION

FROM docker.elastic.co/elasticsearch/elasticsearch:$VERSION

ADD container/ /

RUN /create-accounts.sh \
  && rm --force /create-accounts.*
