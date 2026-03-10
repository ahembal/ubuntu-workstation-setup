#!/usr/bin/env bash
set -euo pipefail

echo "[01-system-update] Updating package index..."
sudo apt update

echo "[01-system-update] Upgrading installed packages..."
sudo apt upgrade -y

echo "[01-system-update] Installing common base utilities..."
sudo apt install -y \
  curl \
  wget \
  git \
  build-essential \
  ca-certificates \
  gnupg \
  lsb-release \
  software-properties-common

echo "[01-system-update] Refreshing firmware metadata..."
sudo fwupdmgr refresh || true

echo "[01-system-update] Checking available firmware updates..."
sudo fwupdmgr get-updates || true

echo "[01-system-update] Done."
echo "Reboot manually if kernel or firmware updates require it."
