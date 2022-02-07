#!/bin/bash

echo "* Add hosts ..."
sudo sh -c 'echo "192.168.99.101 web.hw1.lab web" >> /etc/hosts'
sudo sh -c 'echo "192.168.99.102 db.hw1.lab db" >> /etc/hosts'

echo "* Install Software ..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y mariadb-server

echo "* Allow connection to MariaDB from remote hosts ..."
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
sudo systemctl restart mariadb.service

echo "* Download db from repository ..."
git clone https://github.com/shekeriev/dob-module-1

echo "* Create and load the database ..."
sudo mysql -u root < /home/vagrant/dob-module-1/db/db_setup.sql
