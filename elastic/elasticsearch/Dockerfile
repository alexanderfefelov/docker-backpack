FROM docker.elastic.co/elasticsearch/elasticsearch:7.10.0

ADD container/ /

RUN /create-accounts.sh \
  && rm --force /create-accounts.*
