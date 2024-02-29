FROM archlinux

ARG USER

RUN pacman -Sy --noconfirm zsh git sudo \
  && echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
  && useradd -m -s /usr/bin/zsh -U $USER

WORKDIR /home/$USER
USER $USER
ENV DOTFILES_CONTAINER=1


RUN git clone --bare git@github.com:matsp/dotfiles.git $HOME/.dotfiles \
  && alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"' \
  && dotfiles checkout \
  && dotfiles config --local status.showUntrackedFiles no \
  && dotfiles submodule update --init --recursive

# start bootstrapping
RUN /usr/bin/zsh -c "source ~/.zshrc"

ENTRYPOINT [ "/usr/bin/zsh" ]
