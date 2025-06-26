#  Nexus Testnet III Node Guide

Earn NEX Points by contributing compute power and interacting with the Nexus ecosystem. This guide covers all supported environments and helps you run multiple Nexus CLI nodes reliably, even on GLIBC-limited VPSes.

---


##  1. Create a Nexus Account

1. Go to: [Nexus website](https://app.nexus.xyz)
2. Sign up and follow the linking instructions.
3. Track your rewards on the leaderboard and manage all nodes from your dashboard.

---

## 2. Run a Web-Based Prover

### Easiest way to get started.

- Log in at: [https://app.nexus.xyz](https://app.nexus.xyz)
- Click **Start Node**
- You can run multiple tabs across devices and browsers

---

## 🛒 3. One-Click Node Hosting

- Register at [Mintair](https://mintair.xyz)
- Buy a pre-configured Nexus Node instance

---

## 🧪 4. Chromium on VPS

Want to run browser-based nodes on a VPS?

- Install Chromium
- Open multiple tabs
- Run Nexus dashboard in each

> ⚠️ Performance varies — CLI nodes are preferred for stability.

---

## 🔧 5. CLI Node Setup (Recommended)

### ✅ Requirements

- Linux-based VPS (8GB RAM or more recommended)
- Supports Ubuntu 20.04, 22.04 or similar

---

### ⚙️ One-Line Setup Script (Install Everything Automatically)

Create `install-nexus.sh` and paste this:

```bash
#!/bin/bash
# === Update & Install Dependencies ===
sudo apt update && sudo apt upgrade -y
sudo apt install -y screen curl build-essential pkg-config libssl-dev git-all protobuf-compiler gawk bison gcc make wget tar

# === Install Rust (for Prover Support) ===
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup target add riscv32i-unknown-none-elf

# === Build & Install GLIBC 2.39 Safely ===
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

##  Nexus Node CLI Installer


```bash
bash <(curl -s https://raw.githubusercontent.com/Iziedking/nexus-node-guide/main/install.sh)
```

## **FAQs** 
Can I Use Multiple Devices?

Yes! You can run Nexus nodes on:

- Desktops, laptops, mobile phones, VPS, and servers
- Multiple browser tabs simultaneously
- All managed under **one Nexus account**

---
