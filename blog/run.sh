#!/bin/bash

echo "Wordpress container setup"
echo "Please enter your configuration or press enter to use the default value"

dbname=wordpress
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

mysqlcontainer=learnandplay-mysql
read -p "Linked MySQL container [$mysqlcontainer] : " REPLY
mysqlcontainer=${REPLY:-$mysqlcontainer}

containername=learnandplay-blog
read -p "Container name [$containername] : " REPLY
containername=${REPLY:-$containername}

bindport=8080
read -p "Container binding port [$bindport] : " REPLY
bindport=${REPLY:-$bindport}

sudo docker run \
    -e WORDPRESS_DB_NAME=$dbname \
    -e WORDPRESS_DB_USER=$mysqluser \
    -e WORDPRESS_DB_PASSWORD=$mysqlpassword \
--name $containername --link $mysqlcontainer:mysql -p $bindport:80 -d wordpress