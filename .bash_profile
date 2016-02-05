
# -A All except . and ..
# -F symbols dir/, exec*, ln@
# -G colours
alias ls='ls -AFG'
alias l='ls'
# -long -human suffixes -G colours -T complete time info
alias ll='ls -lhGT'

alias cd.='cd ..'

# Point vi to vim, which points to homebrew vim
# to allow copy/paste support
alias vi='vim'

# Use homebrew python instead of system
alias python='python2'
alias py='python2'

export PYTHONSTARTUP='/Users/ben/.pystartup.py'

alias c='lein repl'

alias ocaml='rlwrap ocaml'

alias ping1='ping -c 1'

alias startpg='postgres -D /usr/local/var/postgres'

# Use GNU rm(1) and prompt before rm'ing > 3 files or recursively
alias rm='grm -I'

alias xx='trash'

alias fuck='sudo $(history -p \!\!)'

alias stripexif='exiftool -all= -overwrite_original'

alias brewup='brew update && brew upgrade && brew cleanup'

alias serve='~/scripts/serve'

export PS1="\u@\h \W\$ "

export EDITOR='vim'

# Red and scary
export SUDO_PS1="\[\e[33;97;41m\][\u@\h] \w#\[\e[0m\] "

# expand aliases into sudo
alias sudo='sudo '

# Golang
export GOPATH=$HOME/go

# Wrap git
eval "$(hub alias -s)"

alias runsight='cd ~/projects/itunes-sight; source sightenv/bin/activate; cd app; sass --watch sight/assets:sight/static/css & python runserver.py';

# laziness: maximum.
alias gst='git status'
alias gc='git checkout'
alias gd='git diff'
#alias gt='git commit -m'
#alias gat='git commit -am'
alias gam='git commit --amend'
alias ga='git add'
alias gap='git add --patch'
alias gf='git fetch'
alias gp='git push'
alias gpl='git pull'
alias gl='git lg'
alias gL='git lg | head -n 6'
alias gb='git branch -av'
alias gbl='git branch -v'
alias gri='git rebase -i'
alias gmer='git merge'

gt() {
    if [ $# -ge 1 ]; then
        git commit -m "$1"
    else
        git commit
    fi
}
gat() {
    if [ $# -ge 1 ]; then
        git commit -a -m "$1"
    else
        git commit -a
    fi
}
g() {
    branch=$(git branch | sed -En 's/\* (.+)/\1/p')
    echo "[${branch}]"
    git status -s
}
grem() {
    if [ $# -ge 1 ]; then
        git remote "$@"
    else
        git remote -v
    fi
}


vimup() {
    for d in $(ls -d ~/.vim/bundle/*); do
        if [ -d "${d}/.git" ]; then
            git -C "$d" fetch
            git -C "$d" pull
        fi
    done
}

grepuniq() {
    # eg. ggrep -oh '{{message\.[^}]\+}}' *.hbs | sort | uniq
    ggrep -oh $1 "$2" | sort | uniq
}

getyoutubeaudio() {
  ffmpeg -i "$1" -f mp4 -vn -acodec copy "$2"
}

cdls() {
    cd $1 && ls
}

llf() {
    ll | grep "$@"
}

export PATH=/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin


if [ -e ".git-completion" ]; then
    source .git-completion
fi
