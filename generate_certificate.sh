#!/usr/bin/env bash

set -e

cd nginx/certificate/ || exit 1
./create-certificate.sh
echo "Done. Need \"nginx -s reload\"."
