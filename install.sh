#!/bin/bash
echo "🛠 Installing Nexus Node CLI Environment..."
chmod +x scripts/*.sh
./scripts/install-deps.sh

echo "✅ Done! You can now use:"
echo "./scripts/run-nexus.sh register-user --wallet-address <your-wallet>"
echo "./scripts/run-nexus.sh register-node"
echo "./scripts/run-nexus.sh start --node-id <your-node-id>"
