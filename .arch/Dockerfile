FROM archlinux

ARG USER
ARG HOSTNAME

RUN pacman -Sy --noconfirm zsh git sudo \
  && echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
  && useradd -m -s /usr/bin/zsh -U $USER \
  && echo "${HOSTNAME}" > /etc/hostname

WORKDIR /home/$USER
USER $USER
ENV BUILD_IMAGE_DOTFILES=1

RUN git init \
  && git remote add origin https://github.com/matsp/dotfiles.git \
  && git branch -M master \
  && git pull origin master \
  && git branch -u origin/master \
  && git submodule update --init --recursive

RUN /home/$USER/.arch/bootstrap \
  && /usr/bin/zsh

ENTRYPOINT [ "/usr/bin/zsh" ]
