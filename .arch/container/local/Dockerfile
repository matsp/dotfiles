FROM ghcr.io/matsp/dotfiles:master

# ssh keys with correct permissions
COPY .ssh .ssh

RUN sudo chown -R dev:dev ~/.ssh; exit 0
RUN sudo chmod 700 ~/.ssh; exit 0
RUN sudo chmod 600 ~/.ssh/id_*; exit 0
RUN sudo chmod 644 ~/.ssh/*.pub; exit 0
RUN sudo chmod 644 ~/.ssh/authorized_keys; exit 0
RUN sudo chmod 644 ~/.ssh/known_hosts; exit 0
RUN sudo chmod 644 ~/.ssh/config; exit 0

# aws & kube auth. tokens
COPY .aws .aws
COPY .kube .kube
RUN sudo chown -R dev:dev ~/.aws; exit 0
RUN sudo chown -R dev:dev ~/.kube; exit 0
