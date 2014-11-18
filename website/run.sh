#!/bin/bash

echo "Django setup"
echo "Please enter your configuration or press enter to use the default value"

secret=changeme
read -p "Secret key [$secret] : " REPLY
secret=${REPLY:-$secret}

dbname=learnandplay
read -p "Database name [$dbname] : " REPLY
dbname=${REPLY:-$dbname}

mysqluser=learnandplay
read -p "MySQL user [$mysqluser] : " REPLY
mysqluser=${REPLY:-$mysqluser}

while true
do
    read -s -p "Password: " mysqlpassword
    echo
    read -s -p "Password (again): " mysqlpassword2
    echo
    [[ -n "$mysqlpassword" && "$mysqlpassword" = "$mysqlpassword2" ]] && break
    echo "Please try again"
done

mysqlhost=`../mysql/get-ip.sh`
read -p "MySQL host [$mysqlhost] : " REPLY
mysqlhost=${REPLY:-$mysqlhost}

mysqlport=3306
read -p "MySQL user [$mysqlport] : " REPLY
mysqlport=${REPLY:-$mysqlport}

bindport=8000
read -p "Container binding port [$bindport] : " REPLY
bindport=${REPLY:-$bindport}

sudo docker run \
    -e LP_SECRET_KEY=$secret \
    -e LP_MYSQL_DBNAME=$dbname \
    -e LP_MYSQL_USER=$mysqluser \
    -e LP_MYSQL_PASSWORD=$mysqlpassword \
    -e LP_MYSQL_HOST=$mysqlhost \
    -e LP_MYSQL_PORT=$mysqlport \
-d -p $bindport:8000 -t learnandplay_container_website