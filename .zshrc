# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mp/.zshrc'

autoload -Uz compinit
compinit

powerline-daemon -q
. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh
# End of lines added by compinstall

export PATH=$PATH:~/git/flutter/bin:~/.pub-cache/bin:/opt/android-sdk/tools/bin:/opt/android-sdk/emulator

export ANDROID_HOME=/opt/android-sdk

alias pixel_9.0='emulator @pixel_9.0 -no-boot-anim -netdelay none -no-snapshot -wipe-data -skin 1080x1920 &'
