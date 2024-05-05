#!/bin/bash

rm -rf /home/llopes-d/data/database/*
echo "CREATE DATABASE IF NOT EXISTS db1 ;\
USE db1; CREATE TABLE t1(agr int);\
CREATE USER IF NOT EXISTS 'lucas'@'%' IDENTIFIED BY '123' ;\
GRANT ALL PRIVILEGES ON *.* TO 'lucas'@'%' ;\
FLUSH PRIVILEGES;" | mariadb
cp -r /var/lib/mysql/* /home/llopes-d/data/database