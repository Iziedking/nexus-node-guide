#!/bin/bash

mkdir -p /opt/glibc-2.39-src && cd /opt/glibc-2.39-src
wget -c https://ftp.gnu.org/gnu/glibc/glibc-2.39.tar.gz
tar -xvzf glibc-2.39.tar.gz
mkdir glibc-build && cd glibc-build
../glibc-2.39/configure --prefix=/opt/glibc-2.39
make -j$(nproc)
sudo make install


export NEXUS_BIN=$(which nexus-network)
export LOADER="/opt/glibc-2.39/lib/ld-linux-x86-64.so.2"
export GLIBCLIB="/opt/glibc-2.39/lib"
export LIBGCC_PATH="/usr/lib/gcc/x86_64-linux-gnu/11"
export FULL_LIB_PATH="$GLIBCLIB:$LIBGCC_PATH:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu"

$LOADER --library-path $FULL_LIB_PATH $NEXUS_BIN "$@"
