FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y && rm -rf /var/lib/apt/lists/*

RUN echo dockerfilee: && env

COPY ./tools/mariadb.sh /

CMD ["/mariadb.sh"]
