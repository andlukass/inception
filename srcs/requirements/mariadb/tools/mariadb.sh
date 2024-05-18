#!/bin/bash

/usr/bin/mariadb-install-db --user=mysql --datadir=/var/lib/mysql --bind-address=0.0.0.0
service mariadb start
echo "CREATE DATABASE IF NOT EXISTS $DB_DBNAME ;\
CREATE USER IF NOT EXISTS '$DB_ADMIN'@'%' IDENTIFIED BY '$DB_ADMIN_PW' ;\
GRANT ALL PRIVILEGES ON *.* TO '$DB_ADMIN'@'%' ;\
FLUSH PRIVILEGES;" | mariadb
service mariadb stop

mysqld_safe --user=mysql --datadir=/var/lib/mysql --bind-address=0.0.0.0
