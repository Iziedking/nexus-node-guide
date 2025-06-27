#!/bin/bash

set -e  # Stop on error

# === Variables ===
GLIBC_VERSION="2.39"
GLIBC_PREFIX="/opt/glibc-$GLIBC_VERSION"
GLIBC_SRC="/opt/glibc-$GLIBC_VERSION-src"
GLIBC_TARBALL="glibc-$GLIBC_VERSION.tar.gz"
GLIBC_URL="https://ftp.gnu.org/gnu/glibc/$GLIBC_TARBALL"

# === Download & Extract ===
mkdir -p "$GLIBC_SRC"
cd "$GLIBC_SRC"

# Only download if it doesn't exist
if [ ! -f "$GLIBC_TARBALL" ]; then
    wget -c "$GLIBC_URL"
fi

# Only extract if the folder is not there
if [ ! -d "glibc-$GLIBC_VERSION" ]; then
    tar -xvzf "$GLIBC_TARBALL"
fi

# === Build & Install ===
mkdir -p glibc-build
cd glibc-build

# Only configure if Makefile doesn’t exist
if [ ! -f Makefile ]; then
    ../glibc-$GLIBC_VERSION/configure --prefix="$GLIBC_PREFIX"
fi

make -j$(nproc)
sudo make install

# === Setup Nexus Execution ===
export NEXUS_BIN=$(which nexus-network)
export LOADER="$GLIBC_PREFIX/lib/ld-linux-x86-64.so.2"
export GLIBCLIB="$GLIBC_PREFIX/lib"
export LIBGCC_PATH="/usr/lib/x86_64-linux-gnu"
export FULL_LIB_PATH="$GLIBCLIB:$LIBGCC_PATH:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu"

$LOADER --library-path $FULL_LIB_PATH $NEXUS_BIN "$@"
