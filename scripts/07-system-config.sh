#!/usr/bin/env bash
set -euo pipefail

echo "[07-system-config] Enabling UFW firewall..."
sudo ufw enable
sudo ufw status

echo "[07-system-config] Installing OpenSSH server..."
sudo apt update
sudo apt install -y openssh-server

echo "[07-system-config] Verifying SSH service..."
sudo systemctl status ssh --no-pager || true

echo "[07-system-config] Done."

