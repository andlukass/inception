FROM debian:bullseye

RUN apt-get update && apt-get install -y \
   php-fpm php-mysql php-curl php-gd \
   php-mbstring php-xml wget && \
   rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php/php7.4-fpm && chown 777 -R /run/php/php7.4-fpm

COPY ./tools/php.sh /

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/php.sh"]