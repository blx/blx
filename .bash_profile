
# -A All except . and ..
# -F symbols dir/, exec*, ln@
# -G colours
alias ls='ls -AFG'
# -long -human suffixes -G colours -T complete time info
alias ll='ls -lhGT'

export BC="/Volumes/BENC timemachine/Backups.backupdb/benmac/Latest/Macintosh HD/Users/bc"

# Use GNU rm(1) and prompt before rm'ing > 3 files or recursively
alias rm='grm -I'

alias fuck='sudo $(history -p \!\!)'

export PS1="\u@\h \W\$ "

export EDITOR='vim'

# Red and scary
export SUDO_PS1="\[\e[33;97;41m\][\u@\h] \w#\[\e[0m\] "

export R_LIBS="~/R-packages"

# Wrap git
eval "$(hub alias -s)"

# expand aliases into sudo
alias sudo='sudo '

alias runsight='cd ~/sight; source sightenv/bin/activate; cd app;  sass --watch sight/assets:sight/static/css & python runserver.py;'

alias simplemachine='cd ~/Documents/School/year\ 2/cpsc\ 213/cpsc213-java-workspace/Simple\ Machine; java -cp SimpleMachine213.jar:bin SimpleMachine -i gui -a sm213 -v solution;'

# laziness: maximum.
alias gst='git status'

alias cdmeet='cd ~/Documents/School/year\ 2/cpsc\ 210\ ta\ term2/meetup-phase2'
alias cdsch='cd ~/Documents/School/year\ 2/'

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

export PATH=/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Developer/Tools/Panda3D:/usr/texbin:/usr/local/bin:/Users/bc/Qt/5.3/clang_64/bin:/Users/bc/Downloads/Software/phantomjs-1.9.8-macosx/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

##
# Your previous /Users/bc/.bash_profile file was backed up as /Users/bc/.bash_profile.macports-saved_2014-11-04_at_18:52:08
##

# MacPorts Installer addition on 2014-11-04_at_18:52:08: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

