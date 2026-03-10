#!/usr/bin/env bash
set -euo pipefail

echo "[02-package-systems] Checking APT..."

if command -v apt >/dev/null 2>&1; then
  apt --version
else
  echo "[ERROR] apt is not installed."
  echo "This setup expects an Ubuntu/Debian system."
  echo "Aborting."
  exit 1
fi

echo "[02-package-systems] Checking Snap..."

if command -v snap >/dev/null 2>&1; then
  echo "[02-package-systems] snap is already installed."
else
  echo "[02-package-systems] snap is missing. Installing snapd..."
  sudo apt update
  sudo apt install -y snapd
fi

echo "[02-package-systems] Verifying Snap..."
snap version

echo "[02-package-systems] Done."
