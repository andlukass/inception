#!/bin/bash

echo "listen = 9000" >> /etc/php/7.4/fpm/pool.d/www.conf

if [ -e "wp-config.php" ]; then
	echo "wordpress files already exists"
else
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod 777 wp-cli.phar && \
	./wp-cli.phar core download --allow-root && \
	./wp-cli.phar config create --dbname="wordpress" --dbuser="master" --dbpass="123" --dbhost="mariadb" --dbprefix="wp_" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root && \
	chmod 777 wp-config.php && \
	./wp-cli.phar core install --url="https://127.0.0.1" --title="titulo4" --admin_user="master" --admin_password="123" --admin_email="master@42.fr" --skip-email --allow-root && \
	./wp-cli.phar user create llopes-d llopes-d@42.fr --role=editor --user_pass=123 --allow-root
fi
	php-fpm7.4 -F


# tail -f
