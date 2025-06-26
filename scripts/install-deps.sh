#!/bin/bash


sudo apt update && sudo apt upgrade -y
sudo apt install -y screen curl build-essential pkg-config libssl-dev git-all protobuf-compiler gawk bison gcc make wget tar


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup target add riscv32i-unknown-none-elf


mkdir -p /opt/glibc-2.39-src && cd /opt/glibc-2.39-src
wget -c https://ftp.gnu.org/gnu/glibc/glibc-2.39.tar.gz
tar -xvzf glibc-2.39.tar.gz

e
cd glibc-2.39
sed -i 's/-Werror//g' Makeconfig


cd ..
mkdir glibc-build && cd glibc-build
../glibc-2.39/configure --prefix=/opt/glibc-2.39
make -j$(nproc)
sudo make install

cd ~
curl https://cli.nexus.xyz/ | sh -y
source ~/.bashrc
