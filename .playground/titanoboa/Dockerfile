FROM quay.io/alexanderfefelov/graalvm:21.0.0.2-java8

ARG VERSION

ARG TITANOBOA_STUFF=titanoboa-${VERSION}_gui.zip
ENV TITANOBOA_HOME=/titanoboa

ADD https://github.com/mikub/titanoboa/releases/download/$VERSION/$TITANOBOA_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       unzip \
  && unzip -qq /$TITANOBOA_STUFF -d $TITANOBOA_HOME \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force /$TITANOBOA_STUFF

WORKDIR $TITANOBOA_HOME

ENTRYPOINT ["./start.sh"]
