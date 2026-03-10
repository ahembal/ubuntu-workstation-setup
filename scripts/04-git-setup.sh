#!/usr/bin/env bash
set -euo pipefail

echo "[04-git-setup] Configuring Git identity..."

# Replace these before running, or export them in the shell:
# export GIT_USER_NAME="Your Name"
# export GIT_USER_EMAIL="your.email@example.com"

: "${GIT_USER_NAME:?GIT_USER_NAME is not set}"
: "${GIT_USER_EMAIL:?GIT_USER_EMAIL is not set}"

git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"

echo "[04-git-setup] Applying recommended Git defaults..."
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.editor nano

echo "[04-git-setup] Ensuring ~/.ssh exists..."
mkdir -p "${HOME}/.ssh"
chmod 700 "${HOME}/.ssh"

if [ -f "${HOME}/.ssh/id_ed25519" ]; then
  echo "[04-git-setup] SSH key already exists at ~/.ssh/id_ed25519"
else
  echo "[04-git-setup] Generating SSH key..."
  ssh-keygen -t ed25519 -C "${GIT_USER_EMAIL}" -f "${HOME}/.ssh/id_ed25519" -N ""
fi

echo "[04-git-setup] Starting ssh-agent..."
eval "$(ssh-agent -s)"

echo "[04-git-setup] Adding SSH key to agent..."
ssh-add "${HOME}/.ssh/id_ed25519"

echo "[04-git-setup] Git configuration:"
git config --global --list

echo "[04-git-setup] Public SSH key:"
cat "${HOME}/.ssh/id_ed25519.pub"

echo "[04-git-setup] Done."
