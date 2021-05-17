FROM	debian:buster

COPY	srcs ./root/

# nginx
RUN	apt-get update \
	apt install nginx -y \
	service nginx start \
	apt install wget -y \
		

CMD tail -f /dev/null
