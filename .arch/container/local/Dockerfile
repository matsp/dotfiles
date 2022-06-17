FROM ghcr.io/matsp/dotfiles:master

ADD .ssh .ssh

RUN sudo chown -R dev:dev ~/.ssh; exit 0
RUN sudo chmod 700 ~/.ssh; exit 0
RUN sudo chmod 600 ~/.ssh/id_*; exit 0
RUN sudo chmod 644 ~/.ssh/*.pub; exit 0
RUN sudo chmod 644 ~/.ssh/authorized_keys; exit 0
RUN sudo chmod 644 ~/.ssh/known_hosts; exit 0
RUN sudo chmod 644 ~/.ssh/config; exit 0

