#!/usr/bin/env bash
set -euo pipefail

echo "[06-dev-tools] Installing Go from Ubuntu repositories..."
sudo apt update
sudo apt install -y golang-go
go version

echo "[06-dev-tools] Removing conflicting Docker packages if present..."
for pkg in docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc; do
  sudo apt remove -y "$pkg" || true
done

echo "[06-dev-tools] Setting up Docker APT repository..."
sudo apt install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

sudo tee /etc/apt/sources.list.d/docker.sources > /dev/null <<DOCKERREPO
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
DOCKERREPO

echo "[06-dev-tools] Installing Docker Engine and plugins..."
sudo apt update
sudo apt install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin

echo "[06-dev-tools] Verifying Docker..."
sudo docker run --rm hello-world

# Optional:
# Adding your user to the docker group allows running docker without sudo.
# Be aware this grants root-level privileges to that user.
# sudo usermod -aG docker "$USER"
# newgrp docker

echo "[06-dev-tools] Installing kubectl..."
cd /tmp
KUBECTL_VERSION="$(curl -L -s https://dl.k8s.io/release/stable.txt)"
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -f kubectl kubectl.sha256

echo "[06-dev-tools] Verifying kubectl..."
kubectl version --client

echo "[06-dev-tools] Done."
