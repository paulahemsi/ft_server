FROM	debian:buster

RUN	apt-get update && apt-get install -y wget
# nginx
RUN	apt-get install -y nginx
# mariaDB
RUN	apt-get install -y mariadb-server
# php
RUN	apt-get install -y php php-cli php-xml php-mbstring php-mysql php7.3-fpm php-gd && \
	apt-get clean
	#clean clears out the local repository of retrieved package files.

#copy nginx configs from outside
ADD	./srcs ./srcs
#symbolic link for nginx_config
RUN	cp ./srcs/nginx_config	./etc/nginx/sites-available/demo_site && \
	ln -s ./etc/nginx/sites-available/demo_site ./etc/nginx/sites-enabled/demo_site 

# website folder with phpinfo
RUN mkdir ./var/www/demo_site && \
	echo "<?php phpinfo(); ?>" >> ./var/www/demo_site/index.php

# ssl
RUN	apt-get install -y openssl && \
	mkdir ./etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=BR/ST=SP/L=SP/O=42SP/CN=phemsi-a' \
	-keyout ./etc/ssl/certs/demo_site.key -out ./etc/ssl/certs/demo_site.crt

RUN	chown -R www-data:www-data /var/www/* && chmod -R 755 /var/www

ENV AUTOINDEX on

# for documentation purposes
EXPOSE 80
EXPOSE 443

#!mudar
ENTRYPOINT	tail -f /dev/null
