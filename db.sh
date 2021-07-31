#!/usr/bin/env bash

debconf-set-selections <<< 'mysql-server mysql-server/root_password password default'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password default'
apt-get update
apt-get install -y mysql-server