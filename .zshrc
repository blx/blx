export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -Uz compinit && compinit

# prepare autocomplete
_git 2>/dev/null

bindkey -e

source "$HOME/.aliases"
source "$HOME/.bash_git"

export PATH="$HOME/bin:$PATH"

# Colours when paging man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'

setopt HIST_IGNORE_SPACE


fpath+=$HOME/.zsh/pure

autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
prompt pure
