#!/bin/bash

sudo docker run \
    -e LP_SECRET_KEY=kofzejiofjzoijfioejefrij \
    -e LP_MYSQL_DBNAME=learnandplay \
    -e LP_MYSQL_USER=learnandplay \
    -e LP_MYSQL_PASSWORD=password \
    -e LP_MYSQL_HOST=`../mysql/get-ip.sh` \
    -e LP_MYSQL_PORT=3306 \
-d -p 8000:8000 -t learnandplay_container_website