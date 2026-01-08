#!/bin/bash
apt-get update -qq
apt-get install -y nginx
systemct1 restart nginx
echo "<h1> Hello this is private vm server from Lumen </h1>" > /var/www/html/index.html