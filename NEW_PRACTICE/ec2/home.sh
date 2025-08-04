#!/bin/bash

apt install httpd -y
systemctl start httpd
systemctl enable httpd
echo "<h1> Hello World </h1> <br> <h2>Welcome to akkitech </h2>" > /var/www/html/index.html
    