test ! -d $HOME/.oh-my-zsh \
  && git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh \
  && exit 0

# dart/flutter cache
export PATH=$PATH:$HOME/.pub-cache/bin:$HOME/git/flutter/bin
export CHROME_EXECUTABLE="google-chrome-stable"
export TERMINAL=kitty

# Dotfiles
alias dotfiles-build='docker build \
  -t matspfeiffer/dotfiles \
  --build-arg USER="mats" \
  --build-arg DOTFILES_GIT_URL="https://github.com/matsp/dotfiles.git" \
  --build-arg GIT_USER="Mats Pfeiffer" \
  --build-arg GIT_EMAIL="mats.pfeiffer@googlemail.com" \
  --build-arg USER_ID=$(id -u) \
  --build-arg GROUP_ID=$(id -g) \
  --build-arg DOCKER_GROUP_ID=$(cut -d: -f3 < <(getent group docker)) \
  --no-cache \
  https://github.com/matsp/docker-dotfiles.git'
alias dotfiles-push='docker push matspfeiffer/dotfiles:latest'
alias dotfiles-create-volume='docker volume create \
  --opt type=tmpfs \
  --opt device=tmpfs \
  --opt o=uid=$(id -u),gid=$(id -g) \
  projects-data'
alias dotfiles-run='docker run --rm -ti \
  --name dotfiles \
  -v ~/.ssh:/home/mats/.ssh:ro \
  -v projects-data:/projects \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  matspfeiffer/dotfiles'

alias update='sudo lvcreate -L10G -s -n root_snap /dev/arch/root && yay'
alias rrs='sudo lvremove -f /dev/arch/root_snap'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias system-deep-clean='yay -Qtdq | yay -Rns -'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lambda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
