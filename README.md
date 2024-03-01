## installation


```
# as root
pacman -S zsh sudo git
gpasswd -a YOUR_USER_NAME wheel
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

# as user
cd $HOME
chsh -s /usr/bin/zsh

git clone --bare --depth 1 --recurse-submodules --shallow-submodules git@github.com:matsp/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
dotfiles submodule update --init --recursive

# open new shell or execute:
zsh
```

## local dotfiles container

```
docker build --build-arg USER=dev -t dotfiles .arch/container
docker run -ti -h dev --name dev dotfiles
```

## github container registry
```
docker run -ti -h dev --name dev ghcr.io/matsp/dotfiles:main
```

## build & run local image with ssh keys
```
cd ~
curl -s -o Dockerfile https://raw.githubusercontent.com/matsp/dotfiles/main/.arch/container/local/Dockerfile && docker build -t dev .
docker volume create dev_projects
docker run -ti -h dev --name dev -v dev_projects:/home/dev/projects dev
```
