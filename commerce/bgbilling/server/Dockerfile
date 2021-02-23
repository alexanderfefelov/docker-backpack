FROM quay.io/alexanderfefelov/graalvm-polyglot:21.0.0.2-java11

ADD build/download-bgbilling-component.sh /

ARG RELEASE
ARG SET

ENV APP_HOME=/BGBillingServer

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       unzip \
  && SERVER_STUFF=$(/download-bgbilling-component.sh BGBillingServer $RELEASE $SET) \
  && unzip -qq $SERVER_STUFF \
  && KERNEL_STUFF=$(/download-bgbilling-component.sh kernel $RELEASE $SET) \
  && unzip -qq -o $KERNEL_STUFF -d $APP_HOME \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force $SERVER_STUFF \
  && rm --force $KERNEL_STUFF

ADD container/ /

WORKDIR $APP_HOME
CMD ["./start-server.sh"]
