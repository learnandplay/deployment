###############################################################
# Dockerfile for the mysql server of the project Learn & Play
# Based on Ubuntu
###############################################################

FROM ubuntu:12.04

MAINTAINER Romain Zanchi

# Update
RUN apt-get update
RUN apt-get upgrade -y

# Basic setup
RUN apt-get -y install mysql-server

# Enable access from outside the container
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ENV user learnandplay
ENV password password

ADD ./start-db-lp.sh /usr/local/bin/start-db-lp.sh
RUN chmod +x /usr/local/bin/start-db-lp.sh

EXPOSE 3306

CMD ["/usr/local/bin/start-db-lp.sh"]