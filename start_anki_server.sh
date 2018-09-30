#!/usr/bin/env bash

cp ./supervisor/anki_server.conf /etc/supervisor/conf.d/anki_server.conf
supervisorctl reload
cp ./nginx/anki_server /etc/nginx/sites-enabled/
nginx -s reload
