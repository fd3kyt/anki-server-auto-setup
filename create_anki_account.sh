#!/usr/bin/env bash

source ./vars.sh

if ! [[ -a ${main_dir}/collections/${anki_account_name} ]];then
    echo "########## add an account \'${anki_account_name}\' to anki sync server ##########"
    echo "########## please enter password for the new account ##########"
    (cd $main_dir && controller adduser "${anki_account_name}")
else
    echo "########## account \'${anki_account_name}\' already exists ##########"
fi
