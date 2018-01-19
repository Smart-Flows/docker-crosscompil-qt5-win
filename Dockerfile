FROM phusion/baseimage:latest

# Source: https://stackoverflow.com/questions/14170590/building-qt-5-on-linux-for-windows/14170591

# http://mxe.cc/#requirements
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        autopoint \
        binutils \
        bison \
        build-essential \
        ca-certificates \
        cmake \
        debhelper \
        devscripts \
        fakeroot \
        flex \
        gcc \
        git \
        gperf \
        intltool \
        libffi-dev \
        libgdk-pixbuf2.0-dev \
        libgmp-dev \
        libmpc-dev \
        libmpfr-dev \
        libtool \
        libtool-bin \
        libz-dev \
        openssl \
        p7zip-full \
        patch \
        pkg-config \
        ruby \
        scons \
        subversion \
        texinfo \
        unzip \
        wget

# Preapre and download cross development environment
RUN mkdir /build
WORKDIR  /build
RUN git clone https://github.com/mxe/mxe.git

# Build cross environment
RUN cd mxe && make qtbase

# Enhance path
ENV PATH /build/mxe/usr/bin:$PATH

# Add a qmake alias
RUN ln -s /build/mxe/usr/bin/i686-w64-mingw32.static-qmake-qt5 /build/mxe/usr/bin/qmake

# Switch to the source directory. The source code will have to be mounted as a volume.
RUN mkdir /src
WORKDIR /src
