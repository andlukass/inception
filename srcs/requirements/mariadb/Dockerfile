FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./tools/mariadb.sh /

ENTRYPOINT ["/mariadb.sh"]
