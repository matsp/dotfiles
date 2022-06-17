## installation

```
# as root
pacman -S zsh sudo git
gpasswd -a YOUR_USER_NAME wheel
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

# as user
cd $HOME
chsh -s /usr/bin/zsh

# initialize empty git
git init
git remote add origin https://github.com/matsp/dotfiles.git # git@github.com:matsp/dotfiles.git
git branch -M master
git pull origin master
git branch -u origin/master
git submodule update --init --recursive

# open new shell or execute:
zsh
```

## local dotfiles container

```
docker build --build-arg USER=dev -t dotfiles .arch/
docker run -ti -h dev --name dev dotfiles
```

## github container registry
```
docker run -ti -h dev --name dev ghcr.io/matsp/dotfiles:master
```

## build & run local image with ssh keys
```
cd ~
curl -s -o Dockerfile https://raw.githubusercontent.com/matsp/dotfiles/master/.arch/container/local/Dockerfile && docker build -t dev .
docker run -ti -h dev --name dev dev
```
