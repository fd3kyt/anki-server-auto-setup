#!/usr/bin/env bash

sudo ./setup_anki_server.sh
su anki_server -c ./add_account.sh
su anki_server -c ./generate_certificate.sh
sudo ./start_anki_server.sh
