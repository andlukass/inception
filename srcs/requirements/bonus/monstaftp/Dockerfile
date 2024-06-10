FROM debian:bullseye

RUN apt-get update && apt-get install -y apache2 php \
   php-mbstring wget unzip

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY ./tools/monsta_install.zip /var/www/html

RUN unzip monsta_install.zip && \
   rm -rf monsta_install.zip && \
   cp -r mftp/* .

RUN sed -i 's/memory_limit = -1/memory_limit = 10M/g' /etc/php/7.4/cli/php.ini

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]