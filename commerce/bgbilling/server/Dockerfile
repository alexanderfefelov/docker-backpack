FROM quay.io/alexanderfefelov/graalvm-polyglot:21.0.0.2-java11

ADD build/download-bgbilling-component.sh /

ARG RELEASE
ARG SET

ENV APP_HOME=/BGBillingServer

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       unzip \
  && SERVER_STUFF=$(/download-bgbilling-component.sh BGBillingServer $RELEASE $SET) \
  && unzip $SERVER_STUFF \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force $SERVER_STUFF

ADD container/ /

WORKDIR $APP_HOME
CMD ["./start-server.sh"]
