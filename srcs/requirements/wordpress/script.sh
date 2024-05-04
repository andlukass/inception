#!/bin/bash

set -e

# Download and extract WordPress
wget -q -O wordpress.zip https://wordpress.org/latest.zip && \
unzip -q wordpress.zip -d /var/www/ && \
rm wordpress.zip && \
chown -R www-data:www-data /var/www/wordpress
chmod 777 -R /var/www/wordpress