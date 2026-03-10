# 05 — Desktop Applications

Common desktop software installed on a new workstation.

## Google Chrome
# Google provides Chrome for Linux as a .deb download for Ubuntu/Debian-based systems.
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

## Visual Studio Code
# Using the official .deb keeps installation explicit on Ubuntu/Debian systems.
cd /tmp
wget -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install -y ./code.deb
rm -f code.deb

## Slack
# Available as a Snap package.
sudo snap install slack

## VLC Media Player
# Available through Ubuntu APT repositories.
sudo apt install -y vlc

## Zoom
# Zoom provides an official Snap package.
sudo snap install zoom-client

## KeePassXC
# Password manager available through Ubuntu APT.
sudo apt install -y keepassxc

## Notion
# There is no official Linux desktop app.
# Recommended: use the web version or install it as a Chrome PWA.
# Optional unofficial Snap client:
# sudo snap install notion-desktop

