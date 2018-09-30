#!/usr/bin/env bash

sudo ./new_user.sh
sudo ./install_dependence.py
su anki_server -c ./add_account.sh
sudo ./start_anki_server.sh
