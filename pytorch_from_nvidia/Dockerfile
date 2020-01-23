#FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime
#FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04
FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
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


RUN apt-get -y install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

# install anaconda
#RUN apt-get install curl
#RUN curl -O https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
#RUN bash -y Anaconda3-2019.10-Linux-x86_64.sh
#RUN conda update conda

ARG PYTHON_VERSION=3.7
ARG WITH_TORCHVISION=1
RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         ca-certificates \
         libjpeg-dev \
         libpng-dev && \
     rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install curl

RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh && \
     /opt/conda/bin/conda install -y python=$PYTHON_VERSION numpy pyyaml scipy ipython mkl mkl-include ninja cython typing && \
     /opt/conda/bin/conda install -y -c pytorch magma-cuda100 && \
     /opt/conda/bin/conda clean -ya
ENV PATH /opt/conda/bin:$PATH
# This must be done before pip so that requirements.txt is available
WORKDIR /opt/pytorch
COPY pytorch .

RUN git submodule update --init --recursive
RUN TORCH_CUDA_ARCH_LIST="3.5 5.2 6.0 6.1 7.0+PTX" TORCH_NVCC_FLAGS="-Xfatbin -compress-all" \
    CMAKE_PREFIX_PATH="$(dirname $(which conda))/../" \
    pip install -v .

RUN if [ "$WITH_TORCHVISION" = "1" ] ; then git clone https://github.com/pytorch/vision.git && cd vision && pip install -v . ; else echo "building without torchvision" ; fi

WORKDIR /workspace
RUN chmod -R a+w .


# Install python packages for image processing.

RUN cd ~/.dotfiles && python install.py
RUN pip install scikit-image
RUN pip install opencv-python

RUN pip install cmake
RUN pip install dlib
RUN pip install jupyter easydict pprint tensorboardX tensorflow pandas torchsummary


CMD ["zsh"]
#CMD ["/bin/bash"]
