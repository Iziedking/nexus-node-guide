#!/bin/bash
set -e

echo " Starting Nexus Prover Setup..."


echo " Installing system packages..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y screen curl build-essential pkg-config libssl-dev git-all protobuf-compiler


echo " Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y


source $HOME/.cargo/env

echo " Adding riscv32i-unknown-none-elf target..."
rustup target add riscv32i-unknown-none-elf


echo " Installing Nexus CLI..."
curl https://cli.nexus.xyz/ | sh


echo " Reloading environment..."
source ~/.bashrc

echo "✅ Done! You can now run Nexus with:"
echo "  nexus-network start --node-id <your-node-id>"
