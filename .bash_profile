if [ -e "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
fi
if [ -e "${HOME}/.bash_aliases" ]; then
    source "${HOME}/.bash_aliases"
fi


# Point vi to vim, which points to homebrew vim
# which supports copy/paste and other stuff
alias vi='vim'

# Manage JDKs
#eval "$(jenv init -)"

# Provide TTY for Krypton GPG git commit signing
export GPG_TTY=$(tty)

export NODE_PATH="$(npm prefix -g --quiet)/lib/node_modules"

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

chrome-canary-socks() {
    /Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --proxy-server="socks5://localhost:${1:-4444}" --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost"
}

https-cert() {
    echo | openssl s_client -showcerts -servername $1 -connect "${1}:443" 2>/dev/null \
        | openssl x509 -inform pem -noout -text
}


export PATH=~/bin:~/.local/bin:~/.cargo/bin:/usr/local/opt/ruby/bin:~/.jenv/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin
export PATH="/usr/local/opt/openjdk/bin:$PATH"


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

if [ -e "${HOME}/.bash_work" ]; then
    source "${HOME}/.bash_work"
fi




###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
