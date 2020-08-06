#!/usr/bin/env bash

source ./vars.sh

command="python3 -m ${module_name}"
directory="$module_parent_dir"
server_user="$user"

cat <<EOF
[program:anki-server]

command=${command}

; working dir
directory=${directory}

; run server as this user. should not be root
user=${server_user}

autostart=true
autorestart=true
redirect_stderr=true
; Sometimes necessary if Anki is complaining about a UTF-8 locale. Make sure
; that the local you pick is actually installed on your system.
environment=LANG=en_US.UTF-8,LC_ALL=en_US.UTF-8,LC_LANG=en_US.UTF-8
EOF
