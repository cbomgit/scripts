#!/bin/bash

#Physical directory where site data will live under /usr/share/webapps
ROOT_DIR=$1

mkdir "/usr/share/webapps/$ROOT_DIR"
cd /usr/share/webapps
wget https://wordpress.org/latest.tar.gz
tar xvzf latest.tar.gz -C $ROOT_DIR --strip-components=1


#Configure mysql database

DB_USER=$2
DB_PW=$3

CREATE USER 'wp_christian'@'localhost' IDENTIFIED BY '***';GRANT USAGE ON *.* TO 'wp_christian'@'localhost' IDENTIFIED BY '***' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;CREATE DATABASE IF NOT EXISTS `wp_christian`;GRANT ALL PRIVILEGES ON `wp\_christian`.* TO 'wp_christian'@'localhost';
