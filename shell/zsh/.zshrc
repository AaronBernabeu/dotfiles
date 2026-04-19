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

eval "$(starship init zsh)"

export PATH="$HOME/.local/bin:$PATH"
