source .bashrc
source .bash_aliases

# Point vi to vim, which points to homebrew vim
# which supports copy/paste and other stuff
alias vi='vim'

# Use homebrew python instead of system
alias python='python2'
alias py='python2'

# Use github's wrapper around git
eval "$(hub alias -s)"

export PS1="\u@\h \W\$ "

# Red and scary
export SUDO_PS1="\[\e[33;97;41m\][\u@\h] \w#\[\e[0m\] "

export EDITOR='vim'

export HISTSIZE=5000
export HISTFILESIZE=10000

# expand aliases into sudo
alias sudo='sudo '

export PYTHONSTARTUP="${HOME}/.pystartup.py"

# Golang
export GOPATH=$HOME/go

recents() {
    # descending frequency count of first words of bash history
    cut -d' ' -f1 ~/.bash_history | sort | uniq -c | sort -r
}

vimup() {
    for d in $(ls -d ~/.vim/bundle/*); do
        if [ -d "${d}/.git" ]; then
            echo "Updating $d"
            git -C "$d" pull
        fi
    done
}

grepuniq() {
    # eg. ggrep -oh '{{message\.[^}]\+}}' *.hbs | sort | uniq
    ggrep --only-matching --no-filename "$1" "${@:2}" | sort | uniq
}

getyoutubeaudio() {
  ffmpeg -i "$1" -f mp4 -vn -acodec copy "$2"
}

llf() {
    ll | grep "$@"
}

export PATH=/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin


if [ -e ".git-completion" ]; then
    source .git-completion
fi

source .bash_git

if [ -e ".bash_blx" ]; then
    source .bash_blx
fi
