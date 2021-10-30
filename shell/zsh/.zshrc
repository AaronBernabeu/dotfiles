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
if [ -f '/home/aaron/google-cloud-sdk/path.zsh.inc' ]; then . '/home/aaron/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/aaron/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/aaron/google-cloud-sdk/completion.zsh.inc'; fi

source <(kubectl completion zsh)
source <(helm completion zsh)
