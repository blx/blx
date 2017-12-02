if [ -e "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
fi
if [ -e "${HOME}/.bash_aliases" ]; then
    source "${HOME}/.bash_aliases"
fi

export PATH=~/bin:~/.local/bin:~/.cargo/bin:~/.jenv/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin


# Point vi to vim, which points to homebrew vim
# which supports copy/paste and other stuff
alias vi='vim'

# Use homebrew python instead of system
alias python='python2'
alias py='python2'

# Use github's wrapper around git
eval "$(hub alias -s)"

# Manage JDKs
eval "$(jenv init -)"

#export PS1="\u@\h \W\$ "
export PS1="\[\e[38;5;33m\]\u@\h \W\$\[\e[0m\] "
#export PS1="\[\e[48;5;33m\]\e[97m\]\u@\h \W\$\[\e[0m\] "

# Red and scary
export SUDO_PS1="\[\e[33;97;41m\][\u@\h] \w#\[\e[0m\] "

export EDITOR='vim'

# Colours when paging man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'

## History

# Number of lines stored in memory during session
export HISTSIZE=5000

# Number of lines kept in file
export HISTFILESIZE=8000

export HISTCONTROL='ignorespace'

shopt -s histappend

__managehistlen() {
    # Archive current histfile and start a new one if too long
    if [ -e "$HISTFILE" ] && [ $(wc -l "$HISTFILE" | awk '{print $1}') -ge $HISTFILESIZE ]; then
        cp "$HISTFILE" "${HISTFILE}-$(date '+%Y%m%dT%H%M%S%z')"
        : > "$HISTFILE"
    fi
}
__managehistlen


# expand aliases into sudo
alias sudo='sudo '

export PYTHONSTARTUP="${HOME}/.pystartup.py"

# Golang
export GOPATH=$HOME/go

recents() {
    # descending frequency count of first words of bash history
    # (or provided alternate history file)
    f=${1:-$HISTFILE}
    cut -d' ' -f1 "$f" | sort | uniq -c | sort -r
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
    ggrep --only-matching --no-filename "$1" "${@:2}" | sort | uniq -c | sort -r
}

extensions() {
    # frequency count of file extensions in given dir
    find "$1" -type f | \
        ggrep --ignore-case --only-matching '\.[^.]*$' | \
        sort | \
        uniq -c | \
        sort -rn
}

getyoutubeaudio() {
    ffmpeg -i "$1" -f mp4 -vn -acodec copy "$2"
}

# Format millisecond timestamps to be readable
# (it stands for 'horloge' u fiends)
hor() {
    # local time
    date -r $(($1 / 1000))
    # UTC
    date -r $(($1 / 1000)) -u
}

jsondiff() {
    # `-S`ort the keys
    diff <(jq -S . "$1") <(jq -S . "$2")
}



if [ -e "${HOME}/.git-completion" ]; then
    source "${HOME}/.git-completion"
fi

if [ -e "${HOME}/.bash_git" ]; then
    # Depends on git-completion for full functionality
    source "${HOME}/.bash_git"
fi

if [ -e "${HOME}/.bash_blx" ]; then
    source "${HOME}/.bash_blx"
fi

if [ -e "${HOME}/.bash_skio" ]; then
    source "${HOME}/.bash_skio"
fi
