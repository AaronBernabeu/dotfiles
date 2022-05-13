#!/usr/bin/env zsh

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "af-magic" "junkfood" "ys" )

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

source <(kubectl completion zsh)
source <(helm completion zsh)
