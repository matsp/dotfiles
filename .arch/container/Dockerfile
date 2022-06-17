FROM archlinux

ARG USER

RUN pacman -Sy --noconfirm zsh git sudo \
  && echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
  && useradd -m -s /usr/bin/zsh -U $USER

WORKDIR /home/$USER
USER $USER
ENV DOTFILES_CONTAINER=1

RUN git init \
  && git remote add origin https://github.com/matsp/dotfiles.git \
  && git branch -M master \
  && git pull origin master \
  && git branch -u origin/master \
  && git submodule update --init --recursive

ENTRYPOINT [ "/usr/bin/zsh" ]