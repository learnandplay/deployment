#!/bin/sh

TAG="learnandplay_container_mysql"
CONTAINER_ID=$(sudo docker ps | grep $TAG | awk '{print $1}')
IP=$(sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' $CONTAINER_ID)
mysql -u learnandplay -p -h $IP