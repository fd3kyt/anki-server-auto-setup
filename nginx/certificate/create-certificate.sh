#!/usr/bin/env bash

set -e

# https://aboutssl.org/how-to-create-and-import-self-signed-certificate-to-android-device/

echo "basicConstraints=CA:true" > android_options.txt

# Create self-signed certificate using these commands
openssl genrsa -out priv_and_pub.key 2048
openssl req -new -days 3650 -key priv_and_pub.key -out CA.pem
openssl x509 -req -days 3650 -in CA.pem -signkey priv_and_pub.key -extfile ./android_options.txt -out CA.crt

# Convert certificate to DER format:
openssl x509 -inform PEM -outform DER -in CA.crt -out CA.der.crt
