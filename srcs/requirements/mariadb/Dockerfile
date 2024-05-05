FROM debian:bullseye

# Install MariaDB
RUN apt-get update -y && apt-get install mariadb-server -y && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /
RUN /etc/init.d/mariadb start

VOLUME /var/lib/mysql

EXPOSE 3306



# CMD ["/script.sh", "mariadbd"]
# CMD ["mysqld_safe"]
# CMD ["/script.sh"]
CMD ["mariadbd"]



# Copy custom MariaDB configuration files
# COPY my.cnf /etc/mysql/my.cnf

# Expor a porta do MySQL

