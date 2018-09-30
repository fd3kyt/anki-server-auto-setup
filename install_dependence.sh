#!/usr/bin/env bash

# run this with sudo

set -x

echo "########## install dependence ##########"

export LC_ALL=C  # if "unsupported locale setting"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python2.7 get-pip.py --force-reinstall

pip install --upgrade pip
pip install --upgrade httplib2
pip install webob PasteDeploy PasteScript sqlalchemy simplejson

apt-get install -y xdg-utils supervisor nginx

mkdir -p applications
cd applications || exit 1

git clone https://github.com/fd3kyt/anki-2.0.47.git
(cd anki-2.0.47 && make install)

git clone https://github.com/fd3kyt/anki-sync-server.git
(cd anki-sync-server && pip install .)

echo "########## install dependence done ##########"
