#!/usr/bin/env bash

source ./vars.sh

# https://aboutssl.org/how-to-create-and-import-self-signed-certificate-to-android-device/

public_ip=$(./public_ip.sh)

# "Usage: "${0} common_name". if not specified, use current IP
function generate-certificate (){
    set -e
    common_name=$1

    if [[ -z ${common_name} ]];then
        common_name="${public_ip}"
    fi

    android_option_file="/tmp/create_certificate_android_options.txt"
    echo "
basicConstraints=CA:true
subjectAltName = @alternate_names

[alternate_names]
DNS.1 = ${common_name}
" > ${android_option_file}

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

    set +e
}

echo "########## may generate a new certificate ##########"
mkdir -p "${certificate_dir}"
cd "${certificate_dir}" || (echo "${certificate_dir} not found"; exit 1)

read -r -p "generate a new certificate in $certificate_dir? [y/N]: " response
case "$response" in
    [yY][eE][sS]|[yY])
        generate-certificate
        echo "########## new certificate generated ##########"
        ;;
    *)
        echo "########## new certificate not generated ##########"
        echo "(You can put CA.crt and private.key to $certificate_dir manually)"
        ;;
esac
