#!/bin/bash
apt-get update
apt-get install openjdk-11-jdk -y
apt-get install curl -y
curl -O https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.28/bin/apache-tomcat-10.1.28.tar.gz && tar -xzvf apache-tomcat-10.1.28.tar.gz
curl -O https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar