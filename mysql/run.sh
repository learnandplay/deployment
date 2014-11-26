#!/bin/bash

echo "MySQL container setup"
echo "Please enter your configuration or press enter to use the default value"

containername=learnandplay-mysql
read -p "Container name [$containername] : " REPLY
containername=${REPLY:-$containername}

bindport=3306
read -p "Container binding port [$bindport] : " REPLY
bindport=${REPLY:-$bindport}

datadir=/data/mysql
read -p "Local database directory [$datadir] : " REPLY
datadir=${REPLY:-$datadir}

sudo docker run --name $containername -d -p $bindport:3306 -v $datadir:/var/lib/mysql learnandplay_container_mysql
