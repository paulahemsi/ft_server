# ft_server :whale:
Docker and web server set up | école 42

* [Introduction](#introduction)
* [Docker](#docker)
* [MariaDB](#mariaDB)
* [phpMyAdmin](#phpMyAdmin)
* [Study resources](#study)
* [Mindmap](#mindmap) 
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
