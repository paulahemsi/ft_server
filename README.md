# ft_server :whale:
Docker and web server set up | école 42

* [Introduction](#introduction)
* [Docker](#docker)
* [MariaDB](#mariaDB)
* [phpMyAdmin](#phpMyAdmin)
* [Study resources](#study)
* [Mindmap](#mindmap) 
* [Step by step](#step_by_step)
* [Testing](#tests) 

## introduction

This [project](en.subject.pdf) is intended to introduce system administration and the importance of using scripts to automate tasks. For that, I will use
the "docker" technology and use it to install a complete web server. This server will run multiples services: Wordpress, phpMyAdmin, and a SQL database.

## docker

[Docker](https://docs.docker.com/get-started/overview/) provides the ability to package and run an application in a loosely isolated environment called a container. The isolation and security allow you to run many containers simultaneously on a given host. Containers are lightweight and contain everything needed to run the application, so you do not need to rely on what is currently installed on the host. You can easily share containers while you work, and be sure that everyone you share with gets the same container that works in the same way.

A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

## mariaDB

[MariaDB](https://mariadb.org/) Server is one of the most popular database servers in the world. It’s made by the original developers of [MySQL](https://www.mysql.com/) and guaranteed to stay open source.

MariaDB turns data into structured information in a wide array of applications, ranging from banking to websites. Originally designed as enhanced, drop-in replacement for MySQL, MariaDB is used because it is fast, scalable and robust, with a rich ecosystem of storage engines, plugins and many other tools make it very versatile for a wide variety of use cases.

MariaDB is developed as open source software and as a relational database it provides an SQL interface for accessing data.

## phpMyAdmin

[phpMyAdmin](https://www.phpmyadmin.net/) is a free software tool written in [PHP](https://www.php.net/), intended to handle the administration of MySQL over the Web. phpMyAdmin supports a wide range of operations on MySQL and MariaDB. Frequently used operations (managing databases, tables, columns, relations, indexes, users, permissions, etc) can be performed via the user interface, while you still have the ability to directly execute any SQL statement.

The phpMyAdmin server will listen on port 80.

## step_by_step
 
`Docker builds images automatically by reading the instructions from a Dockerfile -- a text file that contains all commands, in order, needed to build a given image.`

* Every line in a dockerfile will create a layer. Layers are intermediate images, if you make a change to your Dockerfile, docker will build only the layer that was changed and the ones after that.

* to understand the step-by-step of the process, I first created a dockerfile with only the FROM rule setting the debian image.

The `FROM` instruction initializes a new build stage and sets the Base Image (an image that has no parent image specified in its Dockerfile) for subsequent instructions. As such, a valid Dockerfile must start with a FROM instruction. The image can be any valid image – it is especially easy to start by pulling an image from the Public Repositories.

* `docker build -t <image_name> .` to build the image

* to run the container and be able to enter it `docker run --name <container-name> -it -p 80:80 -p 443:443 <image-name>`. The `it` instruction defines that the container will be running interactively, while `docker exec -it <container_name> sh` allow us to enter in a shell from a container that ir already running, and `exit` allow us to exit it but keep it running 
_____________________
* I have problems to run the container because nginx was already running in the vm

`service --status-all` allow us to see the services running in the machine and `service nginx stop` stops the nginx, so we can use it and run the container
____________________

* inside the container, I install everything I need for the project. Firts, actually, I checked if there was some update with `apt-get update`, then I installed nginx `apt-get install nginx` (need to answer `y` at some point, so a `-y` must be included in the respective dockerfile rule). To check if nginx is running, I wrote `localhost` on the browser, but nothing happens. Looking again in the services, nginx was enable, so `service nginx start` solved the problem. Nginx done!

* Then, we have to edit the configuration file

```
The sites-enabled directory contains the configurations for vhosts that are to be enabled. 
It contains symlinks to the corresponding configuration files in sites-available directory.
```

```
Inside /etc/nginx/sites-available you would see a file named default. 
It is a template file to create your own configuration files.
```

And delete the *default* file that was already there, or the two of then will enter in conflict, listening to the same port.

If nginx has any problem, is possible to check the log in `var/log/nginx/error.log`

`nginx -t` checks if all the configuration was ok
`service nginx restart` restart nginx for the new configuration to take effect.

In that point, a index.html placed in the root of the server is beeing displayed at localhost 

* php 
``` 
apt-get install php-gd php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache	php7.3-readline php-json php-mbstring php7.3-mbstring php-curl php-gd php-intl php-soap php-xml php-xmlrpc php-zip
``` 
also with `-y`

Php-FPM is dedicated fastcgi process manager for php that can interface or connect with any compatible webserver and manage php processes to process php requests.

!having problems to check if php is ok with phpinfo!

* Wordpress 

`install wget` 

```
wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz && tar -xzvf phpMyAdmin-latest-all-languages.tar.gz && mv wordpress /var/www/<server_directoty>/wordpress && mv phpMyAdmin-5.0.4-all-languages /var/www/<server_directoty>/phpMyAdmin
```

* mariaDB 

* `ctrl` + `d` closes the container

* `docker ps` lists all running containers and `docker ps -a` lists all containers, running and stopped

* to reestart a container that is already created `docker start <container_name>`

* `docker stop <container_name>` stops the container

* After this firts test, I removed the container `docker rm <container_name>` and the image `docker rmi <image_name>` and edited my dockerfile with the next steps I had previusly did manualy

* `sudo apt update` and `sudo apt upgrade -y && sudo reboot` ensures the system is updated

"The image defined by your Dockerfile should generate containers that are as ephemeral as possible. By “ephemeral”, we mean that the container can be stopped and destroyed, then rebuilt and replaced with an absolute minimum set up and configuration." from [Dockerfile best pratices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

* 


### dockerfile

from [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)

```
INSTRUCTION arguments
```
The instruction is not case-sensitive. However, convention is for them to be UPPERCASE to distinguish them from arguments more easily.

## Study rescources

* step-by-step [notion](https://www.notion.so/Ft_server-860971f658a7449c89796ba9ebd995f4) by [Lais Arena](https://github.com/laisarena)
* dockerfile [reference](https://docs.docker.com/engine/reference/builder/#from)
* dockerfile [best-pratices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
