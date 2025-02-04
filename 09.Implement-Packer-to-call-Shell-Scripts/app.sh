#!/bin/bash

sleep 30

sudo yum update -y
#install unzip 
#cd into the home directory and unzip the file
#sudo yum install unzip -y
#cd ~/ && unzip Finance_website.zip


# the below commands updates the linux server and then installs httpd (Apache), starts the web server,
# and ensures it automatically starts on server boot

sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd

#Clear the default httpd web directory and copy Finance website files to it.

sudo rm -rf /var/www/html/*
sudo cp -r ~/Finance_website/* /var/www/html/
sudo systemctl reload httpd