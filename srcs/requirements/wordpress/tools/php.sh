#!/bin/bash

# cd /var/www/html
# wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod 777 wp-cli.phar
# ./wp-cli.phar core download --allow-root
# sleep 4
# ./wp-cli.phar config create --dbname="db1" --dbuser="lucas" \
#  --dbpass="123" --dbhost="mariadb" --dbprefix="wp_" --dbcharset="utf8" \
#   --dbcollate="utf8_general_ci" --allow-root
# chmod 777 wp-config.php

# ./wp-cli.phar core install --url="llopes-d.profile.fr" --title="titulo" --admin_user="lucas" --admin_password="123" --admin_email="lucas@lucas.com" --skip-email --allow-root


# php-fpm7.4 -F

tail -f