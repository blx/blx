
# -A All except . and ..
# -F symbols dir/, exec*, ln@
# -G colours
alias ls='ls -AFG'
# -long -human suffixes -G colours -T complete time info
alias ll='ls -lhGT'

# Point vi to vim, which points to homebrew vim
# to allow copy/paste support
alias vi='vim'

alias ping1='ping -c 1'

alias startpg='postgres -D /usr/local/var/postgres'

export BC="/Volumes/BENC timemachine/Backups.backupdb/benmac/Latest/Macintosh HD/Users/bc"

# Use GNU rm(1) and prompt before rm'ing > 3 files or recursively
alias rm='grm -I'

alias fuck='sudo $(history -p \!\!)'

alias stripexif='exiftool -all= -overwrite_original'

export PS1="\u@\h \W\$ "

export EDITOR='vim'

# Red and scary
export SUDO_PS1="\[\e[33;97;41m\][\u@\h] \w#\[\e[0m\] "

export R_LIBS="~/R-packages"

# Wrap git
eval "$(hub alias -s)"

# expand aliases into sudo
alias sudo='sudo '

# Golang
export GOPATH=$HOME/go

alias runsight='cd ~/sight; source sightenv/bin/activate; cd app;  sass --watch sight/assets:sight/static/css & python runserver.py;'

alias simplemachine='cd ~/Documents/School/year\ 2/cpsc\ 213/cpsc213-java-workspace/Simple\ Machine; java -cp SimpleMachine213.jar:bin SimpleMachine -i gui -a sm213 -v solution;'

# laziness: maximum.
alias gst='git status'

alias cdmeet='cd ~/Documents/School/year\ 2/cpsc\ 210\ ta\ term2/meetup-phase2'
alias cdsch='cd ~/Documents/School/year\ 2/'
alias cdb='cd ~/projects/btcbuy/btcbuy'

#alias php54="/usr/local/php5/bin/php"
#alias tw="open -a TextWrangler"

function getyoutubeaudio() {
  ffmpeg -i "$1" -f mp4 -vn -acodec copy "$2"
}

function bcdesktop() {
  if [ $# -lt 1 ]
  then
    echo "Usage: bcdesktop (ssh|wake|socks)"
    return
  fi

  case $1 in
    'ssh') ssh bc@192.168.0.104 ;;
    'wake') wol 00:0d:56:95:d1:1e ;;
    'socks') ssh -N -p 2013 -D 2001 zaphod.uk.to ;;
  esac
}

function cdls() {
    cd $1 && ls
}

llf() {
    ls -lhS | fgrep "$@" ;
}

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

#export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

export PATH=/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin
