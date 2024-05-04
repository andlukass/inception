FROM debian:bullseye

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

# Copy custom MariaDB configuration files
# COPY my.cnf /etc/mysql/my.cnf

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Expose port 3306
EXPOSE 3306

# Command to run when the container starts
CMD ["mysqld", "--user=mysql", "--console"]

