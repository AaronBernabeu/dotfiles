#!/usr/bin/env zsh

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-syntax-highlighting
  autoupdate
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Load zsh files
for i in $HOME/.config/zsh/*; do
    test -r "$i" && source "$i"
done

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then . '~/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then . '~/google-cloud-sdk/completion.zsh.inc'; fi

function _load_completion() {
    local cmd=$1
    local cache=~/.cache/zsh/${cmd}_completion
    if [[ ! -f $cache || $(command $cmd version --short 2>/dev/null) != $(cat ${cache}.version 2>/dev/null) ]]; then
        mkdir -p ~/.cache/zsh
        command $cmd completion zsh > $cache
        command $cmd version --short 2>/dev/null > ${cache}.version
    fi
    source $cache
}
_load_completion kubectl
_load_completion helm

export NVM_DIR="$HOME/.nvm"
function nvm() { unset -f nvm node npm npx && [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" && nvm "$@" }
function node() { unset -f nvm node npm npx && [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" && node "$@" }
function npm() { unset -f nvm node npm npx && [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" && npm "$@" }
function npx() { unset -f nvm node npm npx && [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" && npx "$@" }

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

eval "$(starship init zsh)"

export PATH="$HOME/.local/bin:$PATH"
