#!/bin/bash

sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository "deb http://http.debian.net/debian wheezy-backports main"
sudo apt-get update
sudo apt-get install -y emacs curl
sudo apt-get install -y -t wheezy-backports linux-image-amd64
curl -sSL https://get.docker.com/ | sh