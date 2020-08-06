#!/usr/bin/env bash

# make use of Internet public service
ip_command="curl ifconfig.me"

if ! public_ip=$(${ip_command}) || [[ -z "$public_ip" ]] ;then
    echo "Failed to get ip with \"${ip_command}\""
    exit 1
fi
echo "${public_ip}"
