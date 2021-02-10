export CHROME_EXECUTABLE='google-chrome-stable'
export TERMINAL=alacritty
export LANG=de_DE.UTF-8

typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/.pub-cache/bin" "$HOME/git/flutter/bin" "$path[@]")
export PATH

fpath=($HOME/.zsh/functions $fpath)

# load nodejs function for executable containers
autoload -Uz node_image
