#! /usr/bin/env bash

/usr/local/bin/docker-entrypoint.sh "$@" &
/usr/local/tomcat/bin/catalina.sh run
/bin/bash 
