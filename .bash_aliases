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

# Delete to Trash instead of using `rm`
alias xx='trash'

# Use GNU rm(1) and prompt before rm'ing > 3 files or recursively
alias rm='grm -I'

# Repeat previous command using `sudo`
alias fuck='sudo $(history -p \!\!)'

alias clj='lein repl'
alias ocaml='rlwrap ocaml'

alias ping1='ping -c 1'
alias brewup='brew update && brew upgrade && brew cleanup'
alias startpg='postgres -D /usr/local/var/postgres'

alias stripexif='exiftool -all= -overwrite_original'

# Start a static file server at localhost:8000 rooted in current dir.
# (Port number can also be passed in, eg. `serve 9001`)
alias serve='~/scripts/serve'

# Recursively remove all .pyc in this dir and subdirs
alias pyclean='find . -name "*.pyc" -exec rm -f {} \;'

#alias runsight='cd ~/projects/itunes-sight; source sightenv/bin/activate; cd app; sass --watch sight/assets:sight/static/css & python runserver.py';
