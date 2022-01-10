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

# open new shell or execute:
zsh
```
