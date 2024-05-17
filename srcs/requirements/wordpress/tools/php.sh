#!/bin/bash

if ! [ -e "wp-config.php" ]; then
	wp core download --allow-root && \
	sleep 15 && \
	wp config create --dbname="wordpress" --dbuser="master" --dbpass="123" --dbhost="mariadb" --dbprefix="wp_" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root --extra-php <<PHP
	define( 'WP_REDIS_HOST', 'redis' );
	define( 'WP_REDIS_PORT', '6379' );
	define( 'FS_METHOD', 'direct' );
PHP
	chmod 777 wp-config.php && \
	wp core install --url="https://127.0.0.1" --title="inception" --admin_user="master" --admin_password="123" --admin_email="master@42.fr" --skip-email --allow-root && \
	wp user create llopes-d llopes-d@42.fr --role=editor --user_pass=123 --allow-root && \
	wp plugin install https://downloads.wordpress.org/plugin/redis-cache.2.5.2.zip --allow-root
	wp plugin activate redis-cache --allow-root
	cp wp-includes/class-wp-object-cache.php ./wp-content/
	wp redis enable --allow-root
	wp theme install --activate yuki-reverie-blog --allow-root
fi
	php-fpm7.4 -F