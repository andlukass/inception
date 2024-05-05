#!/bin/bash

service mariadb start 

echo "CREATE DATABASE IF NOT EXISTS meudb ;\
CREATE USER IF NOT EXISTS 'lucas'@'%' IDENTIFIED BY '123' ;\
GRANT ALL PRIVILEGES ON *.* TO 'lucas'@'%' ;\
FLUSH PRIVILEGES;" | mariadb

kill $(cat /var/run/mysqld/mysqld.pid)

exec mariadbd
