#!/bin/bash
    apt install httpd -y
    systemctl start httpd
    systemctl enable httpd
    mkdir /var/www/html/groccary
    echo "<h1> This is groccary Page  </h1>" > /var/www/html/index.html
    EOF 