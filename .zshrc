export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -Uz compinit && compinit

# prepare autocomplete
_git 2>/dev/null

source "$HOME/.aliases"
source "$HOME/.bash_git"
