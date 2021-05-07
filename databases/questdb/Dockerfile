FROM openjdk:15.0.2

ARG VERSION
ARG QUESTDB_STUFF=questdb-$VERSION-no-jre-bin.tar.gz
ENV QUESTDB_HOME=/questdb

ADD https://github.com/questdb/questdb/releases/download/$VERSION/$QUESTDB_STUFF /

RUN mkdir --parents $QUESTDB_HOME \
  && tar --extract --gzip --file=$QUESTDB_STUFF --directory=$QUESTDB_HOME --strip-components=1 \
  && rm --force /$QUESTDB_STUFF

COPY container/ /

CMD ["/backpack-entrypoint.sh"]
