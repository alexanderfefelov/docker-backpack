FROM docker.elastic.co/elasticsearch/elasticsearch:7.9.3

ADD container/ /

RUN /create-accounts.sh \
  && rm --force /create-accounts.*
