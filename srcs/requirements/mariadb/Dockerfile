FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y && rm -rf /var/lib/apt/lists/*

COPY ./tools/mariadb.sh /

EXPOSE 3306

CMD ["/mariadb.sh"]
