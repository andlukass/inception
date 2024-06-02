FROM debian:bullseye

RUN apt-get update && apt-get install -y \
   php-fpm php-mysql php-curl php-gd \
   php-mbstring php-xml wget iputils-ping && \
   rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
   && chmod +x wp-cli.phar \
   && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/php7.4-fpm && chown 777 -R /run/php/php7.4-fpm

RUN echo "listen = 9000" >> /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/php.sh /

WORKDIR /var/www/html

CMD ["/php.sh"]