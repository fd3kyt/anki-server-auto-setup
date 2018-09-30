#!/usr/bin/env bash

set -e

# https://aboutssl.org/how-to-create-and-import-self-signed-certificate-to-android-device/

echo "Usage: ${0} common_name
if not specified, use current IP
=================================="

common_name=$1

if [[ -z ${common_name} ]];then
    common_name=$(hostname -I)
fi


android_option_file="/tmp/create_certificate_android_options.txt"
echo "basicConstraints=CA:true" > ${android_option_file}

# Create self-signed certificate using these commands
openssl genrsa -out private.key 2048
openssl req -new -days 3650 -key private.key -out CA.pem -subj "/CN=${common_name}"
openssl x509 -req -days 3650 \
        -in CA.pem \
        -signkey private.key \
        -extfile ${android_option_file} \
        -out CA.crt

# Convert certificate to DER format:
# openssl x509 -inform PEM -outform DER -in CA.crt -out CA.der.crt
