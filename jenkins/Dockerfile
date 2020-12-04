FROM jenkins/jenkins:2.269

ADD container/ /

USER root

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
  && /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER jenkins
