#!/bin/bash

# `ls` (BSD version)
#    -A All except . and ..
#    -F Suffix symbols: dir/, exec*, ln@
#    -G colours
alias ls='ls -AFG'
alias l='ls'
#    -l long output (detail columns)
#    -h human-readable units (K, M, G) instead of bytes
#    -G colours
#    -T full datetime
alias ll='ls -lhGT'

alias cd.='cd ..'
alias cd..='cd ../..'
alias cd...='cd ../../..'

alias pd='pushd'

alias mkdirp='mkdir -p'
alias jobs='jobs -l'

# Delete to Trash instead of using `rm`
alias xx='trash'

# Use GNU rm(1) and prompt before rm'ing > 3 files or recursively
alias rm='grm -I'

# Format the json in the clipboard
alias jqc='pbpaste | jq'

# Repeat previous command using `sudo`
alias fuck='sudo $(history -p \!\!)'

alias ocaml='rlwrap ocaml'

alias openssl='/usr/local/opt/openssl/bin/openssl'

alias hs='httpstat'

alias brewup='brew update && brew upgrade && brew cleanup'
alias startpg='postgres -D /usr/local/var/postgres'

alias stripexif='exiftool -all= -overwrite_original'

# Recursively remove all .pyc in this dir and subdirs
alias pyclean='find . -name "*.pyc" -exec rm -f {} \;'

alias mysql-start='sudo /usr/local/mysql/support-files/mysql.server start'
alias mysql-stop='sudo /usr/local/mysql/support-files/mysql.server stop'

uuid() { python3 -c 'import uuid; print(str(uuid.uuid4()), end="")' | pbcopy; }

now() { node -e 'process.stdout.write(""+ +new Date())' | pbcopy; }

pw() { openssl rand -base64 24; }

rand() { LC_CTYPE=C tr -dc A-Za-z0-9 < /dev/urandom | head -c $1 | xargs; }

jarls() { jar -tf "$1" | grep -v '/$'; }

#alias runsight='cd ~/projects/itunes-sight; source sightenv/bin/activate; cd app; sass --watch sight/assets:sight/static/css & python runserver.py';

