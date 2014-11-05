#!/bin/bash

if [ ! -d /var/lib/mysql/learnandplay ]; then
    mysql_install_db
    /usr/bin/mysqld_safe &
    sleep 5

    echo "GRANT ALL ON *.* TO $user@'%' IDENTIFIED BY '$password' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

    echo "CREATE DATABASE learnandplay" | mysql
    killall mysqld
    sleep 5
fi

/usr/bin/mysqld_safe