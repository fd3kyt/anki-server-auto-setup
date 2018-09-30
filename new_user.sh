#!/usr/bin/env bash

user=anki_server
main_dir="/home/$user/server_data"

echo "########## adding new user \"$user\" ##########"
sudo adduser $user

mkdir -p $main_dir
cp -r ./server_data/* $main_dir
chown -r $user:$user $main_dir
(cd $main_dir/nginx_certificate && su $user -c ./create-certificate.sh)