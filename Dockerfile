FROM mongo

# while it's not normally the "best practice" to build a composite set of applications in a container, I do this for
# simplicity of development... it's more work and expense to run two containers than one for development purposes

# install jdk, wget, and apache2
RUN apt-get update && apt-get -y install openjdk-11-jdk wget apache2

# install tomcat
RUN mkdir /usr/local/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.34/bin/apache-tomcat-9.0.34.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.34/* /usr/local/tomcat/
COPY bedrock-site.war /usr/local/tomcat/webapps/

# configure the website
RUN mkdir -p /var/run/apache2
RUN mkdir -p /var/lock/apache2
COPY index.html /var/www/html/

COPY docker-start.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/docker-start.sh

EXPOSE 27017 8080 80
ENTRYPOINT ["docker-start.sh"]
CMD ["mongod"]
