#!/bin/bash

/usr/bin/mariadb-install-db --user=mysql --datadir=/var/lib/mysql --bind-address=0.0.0.0
service mariadb start
echo "CREATE DATABASE IF NOT EXISTS db1 ;\
CREATE USER IF NOT EXISTS 'lucas'@'%' IDENTIFIED BY '123' ;\
GRANT ALL PRIVILEGES ON *.* TO 'lucas'@'%' ;\
FLUSH PRIVILEGES;" | mariadb
service mariadb stop

mysqld_safe --user=mysql --datadir=/var/lib/mysql --bind-address=0.0.0.0
