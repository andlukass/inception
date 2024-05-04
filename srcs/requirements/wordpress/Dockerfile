FROM debian:bullseye

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

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

# Install WordPress
COPY script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

# Define o script de entrada como o ENTRYPOINT do contêiner
# ENTRYPOINT ["script.sh"]






# Expose port (if needed)
# EXPOSE 80

# Command to run when the container starts
CMD ["php-fpm7.4", "-F"]