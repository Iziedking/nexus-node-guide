#!/bin/bash
export NEXUS_BIN=$(which nexus-network)
export LOADER="/opt/glibc-2.39/lib/ld-linux-x86-64.so.2"
export GLIBCLIB="/opt/glibc-2.39/lib"
export LIBGCC_PATH="/usr/lib/x86_64-linux-gnu"
export FULL_LIB_PATH="$GLIBCLIB:$LIBGCC_PATH:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu"

$LOADER --library-path $FULL_LIB_PATH $NEXUS_BIN "$@"
