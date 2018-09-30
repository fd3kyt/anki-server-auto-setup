#!/usr/bin/env bash

# run this with sudo

set -e

apt-get install supervisor
cp ./supervisor/anki_server.conf /etc/supervisor/conf.d/anki_server.conf
supervisorctl reload

apt-get install nginx
ln -s -f /home/anki_server/anki_server/nginx/sites-available/anki_server /etc/nginx/sites-enabled/
nginx -s reload
