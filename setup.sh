#!/usr/bin/env bash

sudo ./install_dependence.sh
sudo ./add_user_anki_server.sh
su anki_server -c ./add_anki_account.sh
sudo ./start_anki_server.sh
