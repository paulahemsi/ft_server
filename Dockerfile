FROM	debian:buster

RUN	apt-get update && apt-get install -y wget
RUN	apt-get install -y nginx
RUN	apt-get install -y mariadb-server
RUN	apt-get install -y php php-cli php-xml php-mbstring php-mysql php7.3-fpm php-gd && \
	#clean clears out the local repository of retrieved package files.
	apt-get clean
RUN	apt-get install -y openssl && \
	mkdir ./etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=BR/ST=SP/L=SP/O=42SP/CN=phemsi-a' \
	-keyout ./etc/ssl/certs/demo_site.key -out ./etc/ssl/certs/demo_site.crt
ADD	./srcs ./srcs
#symbolic link for nginx_config
RUN	rm	./etc/nginx/sites-available/default && \
	rm	./etc/nginx/sites-enabled/default && \
	cp ./srcs/nginx_config	./etc/nginx/sites-available/demo_site && \
	cd /etc/nginx/sites-enabled && \
	ln -s ../sites-available/demo_site && \
	cd / && \
	chown -R www-data /var/www/* && chmod -R 755 /var/www/*
# website folder with phpinfo
RUN mkdir ./var/www/demo_site && \
	echo "<?php phpinfo(); ?>" >> ./var/www/demo_site/info.php
#PHPMYADMIN
RUN	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz && \
	tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz && \
	mv phpMyAdmin-4.9.0.1-all-languages var/www/demo_site/phpmyadmin && \
	service php7.3-fpm start && \
	service mysql start && \
	mysql -u root --execute="CREATE DATABASE wordpress; \
					CREATE USER 'phemsi-a'@'localhost' IDENTIFIED BY '1234'; \
					GRANT ALL PRIVILEGES ON wordpress.* TO 'phemsi-a'@'localhost';"
#WORDPRESS
RUN	wget https://wordpress.org/latest.tar.gz && \
	tar xvf latest.tar.gz && \
	mkdir var/www/demo_site/wordpress && \
	cp -a wordpress/. ./var/www/demo_site/wordpress && \
	mv ./srcs/wp-config.php ./var/www/demo_site/wordpress

ENV AUTOINDEX on

# for documentation purposes
EXPOSE 80
EXPOSE 443

WORKDIR	/

ENTRYPOINT	sed --in-place "s/AUTOINDEX/$AUTOINDEX/g" ./etc/nginx/sites-available/demo_site && service nginx start && service mysql start && service php7.3-fpm start && sleep infinity
