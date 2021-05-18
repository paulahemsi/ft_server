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
#copy nginx configs from outside
ADD	srcs srcs
RUN	cp ./srcs/nginx_config	./etc/nginx/sites-available/ && rm ./etc/nginx/sites-available/default && cd etc/nginx/sites-enabled && ln -s ../sites-available/nginx_config
#symbolic link for nginx_config
RUN	service nginx start && service mysql start && service php7.3-fpm start

# for documentation purposes
EXPOSE 80
EXPOSE 443

#!mudar
ENTRYPOINT	tail -f /dev/null

#! esse é o erro que tá dando:
#! root@34d4ed401089:/var/log/nginx# cat error.log 
#!2021/05/18 23:39:59 [emerg] 74#74: open() "/etc/nginx/sites-enabled/default" failed (2: No such file or directory) in /etc/nginx/nginx.conf:62
#!2021/05/18 23:40:10 [emerg] 106#106: open() "/etc/nginx/sites-enabled/default" failed (2: No such file or directory) in /etc/nginx/nginx.conf:62