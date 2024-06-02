FROM debian:bullseye

RUN apt-get update && apt-get install -y \
   wget unzip php php-mysqli php-pdo php-pgsql \
   php-json php-zip php-xml php-mbstring && \
   rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.2.1/phpMyAdmin-5.2.1-all-languages.zip && \
   unzip phpMyAdmin-5.2.1-all-languages.zip && \
   rm phpMyAdmin-5.2.1-all-languages.zip && \
   cp -r phpMyAdmin-5.2.1-all-languages/* . && \
   mv config.sample.inc.php config.inc.php && \
   sed -i 's/localhost/mariadb/g' config.inc.php

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]