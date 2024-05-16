FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget \
    php \
    php-mysqli \
    php-pdo \
    php-pgsql \
    php-json \
    php-zip \
    php-xml \
    php-mbstring && \
   rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html \
    && wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/html/index.php

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000", "-t", "/var/www/html"]
