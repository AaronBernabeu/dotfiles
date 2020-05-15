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