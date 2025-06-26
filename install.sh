#!/bin/bash
echo "🛠 Installing Nexus Node CLI Environment..."

bash <(curl -s https://raw.githubusercontent.com/Iziedking/nexus-node-guide/main/scripts/install-deps.sh)

echo "✅ Done! You can now use:"
echo "bash <(curl -s https://raw.githubusercontent.com/Iziedking/nexus-node-guide/main/scripts/run-nexus.sh) register-user --wallet-address <your-wallet>"
echo "bash <(curl -s https://raw.githubusercontent.com/Iziedking/nexus-node-guide/main/scripts/run-nexus.sh) register-node"
echo "bash <(curl -s https://raw.githubusercontent.com/Iziedking/nexus-node-guide/main/scripts/run-nexus.sh) start --node-id <your-node-id>"
