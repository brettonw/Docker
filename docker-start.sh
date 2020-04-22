#! /usr/bin/env bash

# exit if any command fails
set -e

# start tomcat
(/usr/local/tomcat/bin/catalina.sh start &);

# start apache2
(. /etc/apache2/envvars && /usr/sbin/apache2 -DFOREGROUND &);

# start mongo
/usr/local/bin/docker-entrypoint.sh "$@";
