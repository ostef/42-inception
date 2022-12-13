FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y dumb-init

RUN apt-get install -y curl less

# Install the packages to handle PHP scripts, as well as the MariaDB client
RUN apt-get install -y \
	php-fpm php-mysql php-mysqli \
	mariadb-client

RUN apt-get clean -y

# Install the wordpress CLI. This isn't a package that we can install via apt,
# so we need to download it off github and set it to executable
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
	&& chmod +x /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress

COPY ./tools/setup.sh /tmp/

COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD ["/bin/bash", "/tmp/setup.sh" ]
