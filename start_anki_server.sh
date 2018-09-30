#!/usr/bin/env bash

cp ./supervisor/anki_server.conf /etc/supervisor/conf.d/anki_server.conf
supervisorctl reload
ln -s -f /home/anki_server/anki_server/nginx/sites-available/anki_server /etc/nginx/sites-enabled/
nginx -s reload
