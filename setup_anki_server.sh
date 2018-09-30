#!/usr/bin/env bash

# run this with sudo

set -e

export LC_ALL=C  # if "unsupported locale setting"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python2.7 get-pip.py --force-reinstall
pip install --upgrade pip
pip install --upgrade httplib2
apt install python-pastescript

apt-get install supervisor
cp ./supervisor/anki_server.conf /etc/supervisor/conf.d/anki_server.conf
supervisorctl reload

apt-get install nginx
ln -s -f /home/anki_server/anki_server/nginx/sites-available/anki_server /etc/nginx/sites-enabled/
nginx -s reload
