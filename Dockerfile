FROM mongo

# while it's not normally the "best practice" to build a composite set of applications in a container, I do this for
# simplicity of development... it's more work anc expense to run two containers than one for development purposes

# install jdk
RUN apt-get update && apt-get -y install openjdk-11-jdk wget

# install tomcat
RUN mkdir /usr/local/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.34/bin/apache-tomcat-9.0.34.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.34/* /usr/local/tomcat/

# should we include httpd with a proxy?

EXPOSE 27017 8080

COPY docker-start.sh /usr/local/bin/
ENTRYPOINT ["docker-start.sh"]
