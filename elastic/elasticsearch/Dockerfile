ARG VERSION

FROM docker.elastic.co/elasticsearch/elasticsearch:$VERSION

COPY container/ /

RUN /create-accounts.sh \
  && rm --force /create-accounts.*
