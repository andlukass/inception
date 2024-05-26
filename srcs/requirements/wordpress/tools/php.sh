#!/bin/bash

if ! [ -e "wp-config.php" ]; then
	wp core download --allow-root && \
	wp config create --dbname="wordpress" --dbuser="$DB_ADMIN" --dbpass="$DB_ADMIN_PW" --dbhost="mariadb" --dbprefix="wp_" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root --extra-php <<PHP
	define( 'WP_REDIS_HOST', 'redis' );
	define( 'WP_REDIS_PORT', '6379' );
	define( 'FS_METHOD', 'direct' );
PHP
	chmod 777 wp-config.php && \
	wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$DB_ADMIN --admin_password=$DB_ADMIN_PW --admin_email=master@42.fr --skip-email --allow-root && \
	wp user create $MY_USER llopes-d@42.fr --role=editor --user_pass=$MY_USER_PW --allow-root && \
	wp plugin install https://downloads.wordpress.org/plugin/redis-cache.2.5.2.zip --allow-root
	wp plugin activate redis-cache --allow-root
	wp redis enable --allow-root
	wp theme install --activate blognet --allow-root
fi
	php-fpm7.4 -F