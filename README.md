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
docker build --build-arg USER=mp -t dotfiles .arch/
docker run -ti --user mp -h dev dotfiles
```

## github container registry
```
docker run -ti --user mp -h dev ghcr.io/matsp/dotfiles:master
```
