#!/usr/bin/env bash

target_host=$1

if [[ -z ${target_host} ]];then
    echo "Usage: ${0} username@host"
    exit 1
fi

scp "${target_host}:/home/anki_server/anki_server/nginx/certificate/CA.crt" .
