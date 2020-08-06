#!/usr/bin/env bash

# run this with sudo

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

mkdir -p applications
cd applications || exit 1

git clone https://github.com/ankicommunity/anki-sync-server.git
cd anki-sync-server || exit 1
git submodule update --init
(cd src/anki-bundled && pip install -r requirements.txt && make install)
# pip install .

echo "########## install dependence done ##########"
