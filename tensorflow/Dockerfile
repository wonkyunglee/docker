From tensorflow/tensorflow:1.8.0-gpu-py3
MAINTAINER Wonkyung Lee <leewk92@estsoft.com>

ENV LC_ALL C.UTF-8

RUN apt-get update
RUN apt-get install -y \
    git\
    vim \
    zsh \
    tmux
RUN curl -fsSL https://dotfiles.wook.kr/etc/install | bash

CMD ["zsh"]
