FROM descartesresearch/teastore-base:new
MAINTAINER Chair of Software Engineering <se2-it@informatik.uni-wuerzburg.de>

RUN echo "tomcat.util.scan.StandardJarScanFilter.jarsToSkip=log4j-1.2.15.jar,slf4j-api-1.7.25.jar,slf4j-simple-1.7.25.jar,jackson-jaxrs-base-2.8.4.jar,jackson-jaxrs-json-provider-2.8.4.jar,jersey-container-servlet-core-2.25.1.jar,entities-1.3.8.jar,javassist-3.20.0-GA.jar,javax.annotation-api-1.2.jar,jersey-media-json-jackson-2.25.1.jar,jackson-annotations-2.8.4.jar,hk2-utils-2.5.0-b32.jar,jackson-databind-2.8.4.jar,jersey-container-servlet-2.25.1.jar,jackson-core-2.8.4.jar,jackson-module-jaxb-annotations-2.8.4.jar,hk2-api-2.5.0-b32.jar,jersey-guava-2.25.1.jar,javax.inject-2.5.0-b32.jar,jersey-server-2.25.1.jar,jersey-entity-filtering-2.25.1.jar,jersey-common-2.25.1.jar,sigar-1.6.4.jar,validation-api-1.1.0.Final.jar,aopalliance-repackaged-2.5.0-b32.jar,javax.ws.rs-api-2.0.1.jar,jersey-media-jaxb-2.25.1.jar,osgi-resource-locator-1.0.1.jar,hk2-locator-2.5.0-b32.jar,jersey-client-2.25.1.jar" >> /usr/local/tomcat/conf/catalina.properties

COPY target/*.war /usr/local/tomcat/webapps/
