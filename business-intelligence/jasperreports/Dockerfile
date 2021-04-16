FROM tomcat:9.0.45

ARG VERSION
ARG JASPERREPORTS_STUFF=TIB_js-jrs-cp_${VERSION}_bin.zip

ARG JOLOKIA_VERSION=1.6.2
ARG JOLOKIA_STUFF=jolokia-war-$JOLOKIA_VERSION.war

ENV ks=/etc/jasperserver/keystore
ENV ksp=$ks

WORKDIR /

RUN wget --quiet \
      https://sourceforge.net/projects/jasperserver/files/JasperServer/JasperReports%20Server%20Community%20edition%20$VERSION/$JASPERREPORTS_STUFF \
      https://repo1.maven.org/maven2/org/jolokia/jolokia-war/$JOLOKIA_VERSION/$JOLOKIA_STUFF \
  && unzip -qq $JASPERREPORTS_STUFF \
  && unzip -qq $JOLOKIA_STUFF -d /usr/local/tomcat/webapps/jolokia \
  && rm --force $JASPERREPORTS_STUFF \
  && rm --force $JOLOKIA_STUFF \
  && mv jasperreports-server-cp-$VERSION-bin dist

COPY container/ /

RUN mkdir --parents $ks $ksp \
  && cd dist/buildomatic \
  && echo y | ./js-ant deploy-webapp-ce \
  && cp /resfactory.properties /usr/local/tomcat/webapps/jasperserver/WEB-INF/classes/

WORKDIR $CATALINA_HOME
