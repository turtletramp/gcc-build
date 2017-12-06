FROM ubuntu:16.04

ARG VERSION=0.1
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

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
        build-essential \
        ca-certificates \
        gcc-multilib g++-multilib \
        git \
        libfontconfig1 \
        libice6 \
        libgl1-mesa-dev \
        libsm6 \
        locales \
        mesa-common-dev \
        p7zip \
        cmake \
    && apt-get clean

RUN locale-gen en_US.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

RUN gcc -v
RUN g++ -v
RUN cmake --version

