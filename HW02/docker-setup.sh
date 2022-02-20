#!/bin/bash

echo "* Add hosts ..."
echo "192.168.99.100 docker.hw2.lab docker" >> /etc/hosts

echo "* Add Docker repository ..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "* Install Docker ..."
apt update
apt install -y docker-ce docker-ce-cli containerd.io

echo "* Add vagrant user to docker group ..."
usermod -aG docker vagrant
