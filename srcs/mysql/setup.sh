#!/bin/sh
rc default
ssh-keygen -A
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

echo "create database mspinnet_site;" | mysql -uroot --skip-password
echo "create user mspinnet;" | mysql -uroot --skip-password
echo "grant all on mspinnet_site.* to 'mspinnet'@'%' identified by 'password';" | mysql -uroot --skip-password
echo "flush privileges;" | mysql -uroot --skip-password
mysql -uroot mspinnet_site < ./mspinnet_site.sql
/etc/init.d/mariadb stop

/usr/bin/supervisord -c /etc/supervisord.conf