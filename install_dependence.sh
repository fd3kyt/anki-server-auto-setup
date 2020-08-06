#!/usr/bin/env bash

# run this with sudo

source ./vars.sh

set -x

echo "########## install dependence ##########"

export LC_ALL=C  # if "unsupported locale setting"

apt-get install portaudio19-dev  # for pyaudio
apt-get install python3
apt-get install python3-pip

function pip(){
    python3 -m pip "$@"
}

pip install --upgrade pip
pip install --upgrade httplib2
pip install webob PasteDeploy PasteScript sqlalchemy simplejson

apt-get install -y xdg-utils supervisor nginx

# TODO: delete if already exists?
git clone "$sync_server_git" "$sync_server_dir"
set -e
(cd "${sync_server_dir}" && git submodule update --init)
(cd "${anki_buidled_dir}" && pip install -r requirements.txt && make install)
# cd ${sync_server_dir} || exit 1
# pip install .

echo "########## install dependence done ##########"
