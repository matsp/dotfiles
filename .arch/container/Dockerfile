FROM archlinux

ARG USER

RUN pacman -Sy --noconfirm zsh git sudo \
  && echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
  && useradd -m -s /usr/bin/zsh -U $USER

WORKDIR /home/$USER
USER $USER
ENV DOTFILES_INJECTED=1

RUN git clone --bare --depth 1 --recurse-submodules --shallow-submodules https://github.com/matsp/dotfiles.git $HOME/.dotfiles \
  && git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" checkout \
  && git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" config --local status.showUntrackedFiles no \
  && git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" submodule update --init --recursive

# start bootstrapping
RUN /usr/bin/zsh -c "source ~/.zshrc"

ENTRYPOINT [ "/usr/bin/zsh" ]
