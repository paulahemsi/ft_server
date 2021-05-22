 # ft_server :whale:
Docker and web server set up | école 42

* [Introduction](#introduction)
* [Docker](#docker)
* [MariaDB](#mariaDB)
* [phpMyAdmin](#phpMyAdmin)
* [Dockerfile](#dockerfile) 
* [Study resources](#study)
* [useful commands](#useful)

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

## dockerfile

from [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)

Docker builds images automatically by reading the instructions from a Dockerfile -- a text file that contains all commands, in order, needed to build a given image.

Every line in a dockerfile will create a layer. Layers are intermediate images, if you make a change to your Dockerfile, docker will build only the layer that was changed and the ones after that.

The image defined by your Dockerfile should generate containers that are as ephemeral as possible. By “ephemeral”, we mean that the container can be stopped and destroyed, then rebuilt and replaced with an absolute minimum set up and configuration.

```
INSTRUCTION arguments
```
The instruction is not case-sensitive. However, convention is for them to be UPPERCASE to distinguish them from arguments more easily.

#### ENTRYPOINT

The best use for `ENTRYPOINT`is to set the image's main command, allowing that image to be run as though it was that command.

`ENTRYPOINT` gives a container its default nature or behavior. (can be override with -entrypoint flag in docker run command)
`CMD` dafault is in the dockerfile but can be overrun when docker run command is wrotten.

`RUN` command will be used to build the image
`CMD` only the last one will be executed when we start the container

#### ADD

The `ADD` instruction copies new files, directories or remote file URLs from <src> and adds them to the filesystem of the image at the path <dest>.

#### RUN

The `RUN` instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile.

Layering `RUN` instructions and generating commits conforms to the core concepts of Docker where commits are cheap and containers can be created from any point in an image’s history, much like source control.

#### FROM

The `FROM` instruction initializes a new build stage and sets the Base Image (an image that has no parent image specified in its Dockerfile) for subsequent instructions. As such, a valid Dockerfile must start with a FROM instruction. The image can be any valid image – it is especially easy to start by pulling an image from the Public Repositories.

#### ENV

The `ENV` instruction sets the environment variable <key> to the value <value>. This value will be in the environment for all subsequent instructions in the build stage and can be replaced inline in many as well. The value will be interpreted for other environment variables, so quote characters will be removed if they are not escaped. Like command line parsing, quotes and backslashes can be used to include spaces within values.

 
## Study rescources

* step-by-step [notion](https://www.notion.so/Ft_server-860971f658a7449c89796ba9ebd995f4) by [Lais Arena](https://github.com/laisarena)
* dockerfile [reference](https://docs.docker.com/engine/reference/builder/#from)
* dockerfile [best-pratices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
* [how to configure nginx](https://www.linode.com/docs/guides/how-to-configure-nginx/)
* [editing wp-config](https://wordpress.org/support/article/editing-wp-config-php/)

 
## useful commands
 
`docker build -t <image_name> .` to build the image

`docker run --name <container-name> -it -p 80:80 -p 443:443 <image-name>` to run the container and be able to enter it
 
`docker exec -it <container_name> bash` allow us to enter in a shell from a container that ir already running, and `exit` allow us to exit it but keep it running 
 
`service --status-all` allow us to see the services running in the machine 

`service <service_name> stop` stops the service
 
`service <service_name> start` starts the service
 
`service <service_name> restart` restarts the service

If nginx has any problem, is possible to check the log in `var/log/nginx/error.log`

`nginx -t` checks if all the configuration was ok

`sudo docker kill <container_name>` closes the container

`docker ps` lists all running containers and `docker ps -a` lists all containers, running and stopped

`docker start <container_name>` to start a container that is already created 

`docker stop <container_name>` stops the container

`docker rm <container_name>` removes the container 
 `docker rmi <image_name>` removes the image
 
`sudo apt update` and `sudo apt upgrade -y && sudo reboot` ensures the system is updated
