#!/bin/bash

echo "====> Killing and deleting previous containers"

sudo docker kill learnandplay-mysql
sudo docker rm learnandplay-mysql
sudo docker kill learnandplay-website
sudo docker rm learnandplay-website
sudo docker kill learnandplay-blog
sudo docker rm learnandplay-blog