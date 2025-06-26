#  Nexus Testnet III Node Guide

Earn NEX Points by contributing compute power and interacting with the Nexus ecosystem. This guide covers all supported environments and helps you run multiple Nexus CLI nodes reliably, even on GLIBC-limited VPSes.

---


##  1. Create a Nexus Account if you don't have one else if you participated in testnet I and II just sing in 

1. Go to: [Nexus website](https://app.nexus.xyz)
2. Sign up and follow the linking instructions.
3. Track your rewards on the leaderboard and manage all nodes from your dashboard.

---

## 2. Run a Web-Based Prover

- Log in at: [https://app.nexus.xyz](https://app.nexus.xyz)
- Click **Start Node**
- You can run multiple tabs across devices and browsers

---

## 3. One-Click Node Hosting

- Register at [Mintair](https://mintair.xyz)
- Buy a pre-configured Nexus Node instance

---

##  4. CLI Node Setup (Recommended)

### Requirements

- Linux-based VPS (8GB RAM or more recommended)
- Supports Ubuntu 20.04, 22.04 or similar


##  Nexus Node CLI Installer

### Login into your VPS as root user and run the following commands

```bash
bash <(curl -s https://raw.githubusercontent.com/Iziedking/nexus-node-guide/main/install.sh)
```
### Create a screen
```bas
screen -S nexus
```
### start node with node ID
```bash
nexus-network start --node-id your-node-id
```
### How to get node ID
#### From Nexus web App
i. Goto [Node region](https://app.nexus.xyz/nodes)
ii. Click on ``Add Node`` then ``Add CLI Node`` then copy ``node-id`` (replace ``your-node-id`` with ``node-id`` you copied)
#### From CLI direct
i. Register your wallet first (copy from Nexus dashboard)
```bash
source ~/.bashrc

nexus-network register-user --wallet-address your-wallet-address
```
ii. Replace ``your-wallet-address`` with address you copied

iii. Create node ID
```bash
nexus-network register-node
```
iv. Then go to dashboard copy ID and replace with ``your-node-id``

---
## 5. If you are using ubuntu 22.0 or below you might face errors like 
**Error: nexus-network: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.39' not found (required by nexus-network)**
to fix that run this script
```bash
bash <(curl -s https://raw.githubusercontent.com/yourusername/nexus-node-guide/main/scripts/run-nexus.sh)
```
then start node in your screen
```bash
./start --node-id <your-node-id>
```
---
## 6. Want to run multiple nodes 
1. create multiple ``node-id``
2. open multiple screen for each
3. if you did not face any GLIBC-limited error thrn run
```bash
nexus-network start --node-id your-node-id
```
4. Run on each screen you open to start node
   
5. If you faced GLIBC-limited error then run
```bash
./start --node-id <your-node-id>
```
6. Run this on each screen you create
---
## 7. Check System load
```bash
sudo apt install htop
htop
```

## ❓**FAQs** 
Can I Use Multiple Devices?

Yes! You can run Nexus nodes on:

- Desktops, laptops, mobile phones, VPS, and servers
- Multiple browser tabs simultaneously
- All managed under **one Nexus account**

Why run multiple Nodes?

- More nodes = more NEX
- Run only what your system can handle
- Run htop to monitor CPU/RAM

---
## Screen Commands

| Action        | Command                 |
| ------------- | ----------------------- |
| Detach screen | `CTRL + A + D`          |
| Resume screen | `screen -r nexus`       |
| Kill screen   | `screen -XS nexus quit` |

---
Goodluck

## Credits
Official docs: https://docs.nexus.xyz
Community-sourced optimizations and testing
follow me on [X](https://x.com/Iziedking) here
