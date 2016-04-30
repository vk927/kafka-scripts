#!/bin/bash
sudo yum install wget
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -Uvh epel-release-latest-7*.rpm
sudo yum install ansible
echo
echo
echo "-----------------------------------------------"
echo "-----------------------------------------------"
echo " changing the permissions of the  keys directory recursively to 700 to restrict  ssh clients private key  ---"
sudo chmod -R 700 keys
