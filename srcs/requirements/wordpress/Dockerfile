FROM debian:bullseye

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php/php7.4-fpm && chown -R www-data:www-data /run/php/php7.4-fpm

COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/php.sh /

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/php.sh"]