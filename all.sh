#!/usr/bin/env bash

sudo ./install_dependence.sh
sudo ./new_user.sh
su anki_server -c ./add_account.sh
sudo ./start_anki_server.sh
