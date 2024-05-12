FROM debian:bullseye

# Install MariaDB
RUN apt-get update -y && apt-get install mariadb-server -y && rm -rf /var/lib/apt/lists/*

# Copy the script to the containe
COPY ./tools/mariadb.sh /

EXPOSE 3306

CMD ["/mariadb.sh"]
