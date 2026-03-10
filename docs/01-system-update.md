# 01 — System Update

These are the first commands to run on a fresh Ubuntu installation.

## Update package index

sudo apt update

## Upgrade installed packages

sudo apt upgrade -y

## Install common base utilities

sudo apt install -y \
  curl \
  wget \
  git \
  build-essential \
  ca-certificates \
  gnupg \
  lsb-release \
  software-properties-common

## Optional: firmware updates

sudo fwupdmgr refresh
sudo fwupdmgr update

## Reboot if kernel or firmware was updated

sudo reboot

## Check which devices support firmware updates

sudo fwupdmgr get-devices

## Check if updates are available

sudo fwupdmgr get-updates

