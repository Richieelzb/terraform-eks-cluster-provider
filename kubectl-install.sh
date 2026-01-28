#!/bin/bash
set -e

echo "=== Installing latest kubectl ==="

# Install dependencies
sudo yum install -y curl

# Download the latest stable kubectl binary (Linux AMD64)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# (Optional but recommended) Download checksum file
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

# Validate checksum (optional)
echo "Validating checksum..."
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# Install kubectl to /usr/local/bin
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
