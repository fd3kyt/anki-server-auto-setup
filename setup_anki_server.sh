#!/usr/bin/env bash

# run this with sudo

set -e

export LC_ALL=C  # if "unsupported locale setting"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python2.7 get-pip.py --force-reinstall

pip install --upgrade pip
pip install --upgrade httplib2
pip install webob PasteDeploy PasteScript sqlalchemy simplejson
# apt install python-pastescript

apt-get install -y xdg-utils supervisor nginx
