export CHROME_EXECUTABLE='google-chrome-stable'
export TERMINAL=alacritty
export LANG=de_DE.UTF-8
export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab
export TERM=xterm-256color

typeset -U PATH path
# path=("$HOME/.local/bin" "$HOME/.pub-cache/bin" "$HOME/git/flutter/bin" "$HOME/.cargo/bin" "$path[@]")
path=("$HOME/.local/bin" "$HOME/.pub-cache/bin" "$HOME/.cargo/bin" "$path[@]")
# path=("$HOME/.local/bin" "$HOME/.pub-cache/bin" "$path[@]")
export PATH

fpath=($HOME/.zsh/functions $fpath)

# load nodejs function for executable containers
# autoload -Uz node_image
# autoload -Uz hugo_image
