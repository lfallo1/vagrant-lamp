#!/bin/bash

#update CentOs with patches
yum update -y --exclude=kernel

#tools
yum install -y nano git unzip screen

#apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
servicde httpd stop

#create symbolic link from vagrant (also the shared folder on host) to apache's web server
rm -rf /var/www/html
ln -s /vagrant /var/www/html

#start apache
service httpd start

#PHP
yum install -y php php-cli php-common php-devel php-mysql

#MySQL - load on system startup
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

#start and execute dummy command to confirm MySQL is running
service mysqld start
mysql -u root -e "SHOW DATABASES";

#Download starter content
service httpd restart
