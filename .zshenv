typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/.pub-cache/bin" "$HOME/git/flutter/bin" "$path[@]")
export PATH

fpath=($HOME/.zsh/functions $fpath)

autoload -Uz node_image
