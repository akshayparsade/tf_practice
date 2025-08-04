#!/bin/bash

apt install httpd -y
systemctl start httpd
systemctl enable httpd
mkdir /var/www/html/elctronix
echo "<h1> SALE SALE SALE ON  elctronix items  </h1>" > /var/www/html/index.html
    EOF 