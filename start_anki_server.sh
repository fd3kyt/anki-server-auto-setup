#!/usr/bin/env bash

echo "########## start supervisor and nginx ##########"

./supervisor_template.sh > /etc/supervisor/conf.d/anki_server.conf
supervisorctl reload
cp ./nginx/* /etc/nginx/sites-enabled/
nginx -s reload
