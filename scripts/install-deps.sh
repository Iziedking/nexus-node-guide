#!/bin/bash

# === Update & Install System Dependencies ===
sudo apt update && sudo apt upgrade -y
sudo apt install -y screen curl build-essential pkg-config libssl-dev git-all protobuf-compiler gawk bison gcc make wget tar

# === Install Rust (required for prover) ===
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup target add riscv32i-unknown-none-elf

# === Build & Install GLIBC 2.39 (Safe method) ===
mkdir -p /opt/glibc-2.39-src && cd /opt/glibc-2.39-src
wget -c https://ftp.gnu.org/gnu/glibc/glibc-2.39.tar.gz
tar -xvzf glibc-2.39.tar.gz
mkdir glibc-build && cd glibc-build
../glibc-2.39/configure --prefix=/opt/glibc-2.39
make -j$(nproc)
sudo make install

# === Install Nexus CLI ===
cd ~
curl https://cli.nexus.xyz/ | sh
source ~/.bashrc
