FROM ubuntu:16.04

ARG VERSION=0.2
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="gcc-build" \
      org.label-schema.description="A headless gcc build environment for Ubuntu" \
      org.label-schema.url="e.g. https://github.com/turtletramp/gcc-build" \
      org.label-schema.vcs-ref="$VCS_REF" \
      org.label-schema.vcs-url="https://github.com/turtletramp/gcc-build.git" \
      org.label-schema.version="$VERSION" \
      org.label-schema.schema-version="1.0"


RUN apt-get update -q && apt-get install -y software-properties-common && apt-get clean
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
      
RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
        gcc-8 g++-8 gcc-8-multilib g++-8-multilib gcc-8-base cpp-8 libgcc-8-dev linux-libc-dev \
        linux-headers-generic \
        ca-certificates \
        git \
        libfontconfig1 \
        libice6 \
        libgl1-mesa-dev \
        libsm6 \
        locales \
        mesa-common-dev \
        p7zip \
        make \
    && apt-get clean
#    gcc-multilib g++-multilib \
    #cmake \        # cmake 3.5.1 is too old; lets install current version manually

#RUN apt-get update -q && apt-get install -y gcc-7 g++-7 gcc-7-multilib gcc-7-base cpp-7 libgcc-7-dev && apt-get clean

RUN locale-gen en_US.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

RUN ln -s /usr/bin/gcc-8 /usr/bin/gcc
RUN ln -s /usr/bin/g++-8 /usr/bin/g++
RUN ln -s /usr/bin/cpp-8 /usr/bin/cpp
RUN ln -s /usr/include/asm-generic /usr/include/asm

#RUN gcc -v
#RUN g++ -v

# install cmake
ADD https://github.com/Kitware/CMake/releases/download/v3.31.1/cmake-3.31.1-linux-x86_64.sh /tmp/cmake.sh
RUN sh /tmp/cmake.sh --prefix=/usr/local --exclude-subdir
RUN ln -s /usr/local/bin/cmake /usr/bin/cmake

RUN cmake --version

