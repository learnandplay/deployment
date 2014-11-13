########################################################
# Dockerfile for website of the project Learn & Play
# Based on Ubuntu
########################################################

FROM ubuntu:12.04

MAINTAINER Romain Zanchi

# Basic setup
RUN apt-get update
RUN apt-get install -y git wget libmysqlclient-dev

# Python
RUN apt-get install -y python-dev python-pip

#install
WORKDIR /home
RUN git clone  https://github.com/learnandplay/website.git
WORKDIR /home/website
RUN pip install -r requirements.txt

EXPOSE 8000

# Run website starting script
ADD ./start-website.sh /usr/local/bin/start-website.sh
RUN chmod +x /usr/local/bin/start-website.sh

CMD ["/usr/local/bin/start-website.sh"]
