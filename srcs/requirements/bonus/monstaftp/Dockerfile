FROM debian:bullseye

RUN apt-get update && apt-get install -y php wget unzip

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY ./tools/monsta_install.zip /var/www/html

RUN unzip monsta_install.zip
RUN cp -r mftp/* .
RUN rm -rf monsta_install.zip mftp

RUN sed -i 's/memory_limit = -1/memory_limit = 1024M/g' /etc/php/7.4/cli/php.ini

ENTRYPOINT ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]