#!/bin/bash

echo 'Starting Provision: ng'
sudo apt-get update
sudo apt-get install -y nginx
sudo service nginx stop
sudo rm -rf /etc/nginx/sites-enabled/default
sudo touch /etc/nginx/sites-enabled/default
echo "upstream testapp {
        server 10.0.0.3;
        server 10.0.0.4;
}

server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /usr/share/nginx/html;
        index index.html index.htm;

        # Make site accessible from http://localhost/
        server_name localhost;

        location / {
                proxy_pass http://testapp/;
        }

}" >> /etc/nginx/sites-enabled/default
sudo service nginx start
echo "Machine: ng" >> /usr/share/nginx/html/index.html
echo 'Provision ng complete'