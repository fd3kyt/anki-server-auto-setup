#!/usr/bin/env bash

set -x

sudo ./install_dependence.sh

user=anki_server
main_dir="/home/$user/server_data"

echo "########## add a new user \"$user\" ##########"
sudo adduser $user

echo "########## copy data to $main_dir ##########"
mkdir -p $main_dir
cp -r ./server_data/* $main_dir
chown -R $user:$user $main_dir

certificate_dir=$main_dir/nginx_certificate
echo "########## may generate a new certificate ##########"
(cd $certificate_dir && su $user -c "chmod +x ./generate-certificate.sh")
read -r -p "generate a new certificate in $certificate_dir? [y/N]" response
case "$response" in
    [yY][eE][sS]|[yY])
        (cd $certificate_dir && su $user -c "./generate-certificate.sh")
        echo "########## new certificate generated ##########"
        ;;
    *)
        echo "########## new certificate not generated ##########"
        echo "(You can put CA.crt and private.key to $certificate_dir manually)"
        ;;
esac

anki_account_name=anki
if ! [[ -a ${main_dir}/collections/${anki_account_name} ]];then
    echo "########## add an account \'${anki_account_name}\' to anki sync server ##########"
    echo "########## please enter password for the new account ##########"
    (cd $main_dir && su $user -c "ankiserverctl.py adduser ${anki_account_name}")
else
    echo "########## account \'${anki_account_name}\' already exists ##########"
fi

sudo ./start_anki_server.sh

echo "########## all done ##########"
echo "########## verify: open https://<ip_address>:27702 ##########"
echo "########## sync data is stored in $main_dir ##########"
