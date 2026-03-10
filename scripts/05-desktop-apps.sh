#!/usr/bin/env bash
set -euo pipefail

echo "[05-desktop-apps] Installing desktop applications..."

echo "[05-desktop-apps] Installing Google Chrome..."
cd /tmp
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

echo "[05-desktop-apps] Installing Visual Studio Code..."
cd /tmp
wget -q -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install -y ./code.deb
rm -f code.deb

echo "[05-desktop-apps] Installing Slack..."
sudo snap install slack

echo "[05-desktop-apps] Installing VLC..."
sudo apt install -y vlc

echo "[05-desktop-apps] Installing Zoom..."
sudo snap install zoom-client

echo "[05-desktop-apps] Installing KeePassXC..."
sudo apt install -y keepassxc

echo "[05-desktop-apps] Done."
