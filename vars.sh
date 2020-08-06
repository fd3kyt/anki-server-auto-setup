#!/usr/bin/env bash

user=anki_server
main_dir="/home/$user/server_data"

sync_server_git="https://github.com/ankicommunity/anki-sync-server.git"
sync_server_dir="${main_dir}/anki-sync-server"
anki_buidled_dir="${sync_server_dir}/src/anki-bundled/"

certificate_dir=$main_dir/nginx_certificate

anki_account_name=anki

export user main_dir
export sync_server_git sync_server_dir anki_buidled_dir
export certificate_dir anki_account_name

controller_path="${sync_server_dir}/src/ankisyncctl.py"
function controller(){
    python3 "${controller_path}" "$@"
}
