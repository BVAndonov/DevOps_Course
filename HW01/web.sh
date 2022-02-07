#!/bin/bash

echo "* Add hosts ..."
sudo sh -c 'echo "192.168.99.101 web.hw1.lab web" >> /etc/hosts'
sudo sh -c 'echo "192.168.99.102 db.hw1.lab db" >> /etc/hosts'

echo "* Install Software ..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y apache2 php php-mysql

echo "* Download web site from repository ..."
git clone https://github.com/shekeriev/dob-module-1

echo "* Copy web site files to /var/www/html/ ..."
sudo rm /var/www/html/index.html
sudo cp /home/vagrant/dob-module-1/web/* /var/www/html

#Adjust the parameters of the config.php file for the web site
dbParam='bulgaria'
userParam='web_user'
pswdParam='Password1'
hostParam=$(dig db +short)
sudo sed -i -e 's|$database = "";|$database = "'$dbParam'";|' -e 's|$user = "";|$user = "'$userParam'";|' -e 's|$password  = "";|$password = "'$pswdParam'";|' -e 's|$host = "";|$host = "'$hostParam'";|' /var/www/html/config.php
