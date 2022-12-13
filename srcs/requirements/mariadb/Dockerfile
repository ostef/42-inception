FROM debian:buster

ARG DB_DATABASE
ARG DB_USER_NAME
ARG DB_USER_PASSWORD
ARG DB_ROOT_PASSWORD

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y dumb-init

RUN apt-get install -y mariadb-server

RUN apt-get clean -y

# You notice we call mysql and not mariadb. This is because MariaDB
# is a fork of MySQL, even though they are different the name of the
# commands we invoke and folders we use are as if we were using MySQL

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

RUN service mysql start \
	&& mysql -u root -e \
	"CREATE DATABASE IF NOT EXISTS $DB_DATABASE; \
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD'; \
	GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASSWORD'; \
	FLUSH PRIVILEGES;"

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD ["mysqld", "--bind-address=0.0.0.0" ]
