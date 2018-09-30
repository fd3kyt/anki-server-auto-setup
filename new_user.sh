#!/usr/bin/env bash

set -x

user=anki_server
main_dir="/home/$user/server_data"

echo "########## adding new user \"$user\" ##########"
sudo adduser $user

mkdir -p $main_dir
cp -r ./server_data/* $main_dir
chown -R $user:$user $main_dir

(cd $main_dir/nginx_certificate && \
     su $user -c "chmod +x ./create-certificate.sh" && \
     su $user -c "./create-certificate.sh")
