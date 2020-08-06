#!/usr/bin/env bash

user=anki_server
main_dir="/home/$user/server_data"

certificate_dir=$main_dir/nginx_certificate

anki_account_name=anki

export user main_dir certificate_dir anki_account_name
