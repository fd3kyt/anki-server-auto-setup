#!/usr/bin/env bash

set -x
set -e

chmod +x ./*.sh

source ./vars.sh

sudo ./install_dependence.sh

echo "########## add a new user \"$user\" ##########"
sudo adduser $user

echo "########## copy data to $main_dir ##########"
mkdir -p $main_dir
cp -r ./server_data/* $main_dir
chown -R $user:$user $main_dir

su $user -c "./certificate.sh"
su $user -c "./create_anki_account.sh"

sudo ./start_anki_server.sh

set +x
echo "########## all done ##########"
public_ip=$(./public_ip.sh)
echo "########## verify: open https://$public_ip:27702 ##########"
echo "########## sync data is stored in $main_dir ##########"
