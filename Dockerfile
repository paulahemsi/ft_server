FROM	debian:buster

RUN	apt-get update \
	&& apt-get install -y wget
# nginx
RUN	apt-get install -y nginx
# mariaDB
RUN	apt-get install -y mariadb-server
# php
RUN	apt-get install -y php \
	php-cli\
	php-xml \
	php-mbstring \
	php-mysql \
	php7.3-fpm \
	php-gd \
	#clean clears out the local repository of retrieved package files.
	#It removes everything but the lock file from /var/cache/apt/archives/ and /var/cache/apt/archives/partial/
	&& apt-get clean
	
ADD	srcs	srcs
# for documentation purposes
EXPOSE 80
EXPOSE 443

ENTRYPOINT	

CMD tail -f /dev/null