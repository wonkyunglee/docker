FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime
MAINTAINER Wonkyung Lee <leewk921223@gmail.com>

RUN apt-get update
RUN apt-get install -y \
    git\
    vim \
    zsh \
    tmux \
    htop

# Install language pack
RUN apt-get install -y \
    language-pack-en
RUN locale-gen en_US.utf8
RUN update-locale
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN apt-get install -y libsm6 libxext6 libxrender-dev libglib2.0-0
#RUN curl -fsSL https://dotfiles.wook.kr/etc/install | bash
RUN git clone --recursive https://github.com/wonkyunglee/dotfiles.git ~/.dotfiles
RUN cd ~/.dotfiles && python install.py

# Install python packages for image processing.
RUN pip install scikit-image
RUN pip install opencv-python

RUN pip install cmake
RUN pip install dlib
RUN pip install jupyter easydict pprint tensorboardX tensorflow pandas torchsummary


CMD ["zsh"]

