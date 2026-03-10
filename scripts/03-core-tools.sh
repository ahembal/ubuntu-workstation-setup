#!/usr/bin/env bash
set -euo pipefail

echo "[03-core-tools] Updating package index..."
sudo apt update

echo "[03-core-tools] Installing core tools..."
sudo apt install -y \
  git \
  curl \
  wget \
  build-essential \
  jq \
  htop

echo "[03-core-tools] Verifying installed tools..."
git --version
curl --version | head -n 1
wget --version | head -n 1
jq --version
htop --version

echo "[03-core-tools] Done."
