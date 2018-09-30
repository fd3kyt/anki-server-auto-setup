#!/usr/bin/env bash

target_host=$1
output_dir=$2

if [[ -z ${target_host} ]];then
    echo "Usage: ${0} username@host [output_dir]"
    exit 1
fi

if [[ -z $output_dir ]];then
    output_dir="."
fi

scp "${target_host}:/home/anki_server/server_data/nginx_certificate/CA.crt" "$output_dir"
