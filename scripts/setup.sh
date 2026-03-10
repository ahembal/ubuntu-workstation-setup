#!/usr/bin/env bash
set -euo pipefail

echo "======================================"
echo "Ubuntu Workstation Setup"
echo "======================================"

SCRIPTS=(
  "01-system-update.sh"
  "02-package-systems.sh"
  "03-core-tools.sh"
  "04-git-setup.sh"
  "05-desktop-apps.sh"
  "06-dev-tools.sh"
  "07-system-config.sh"
)

for script in "${SCRIPTS[@]}"; do
  echo ""
  echo "--------------------------------------"
  echo "Running $script"
  echo "--------------------------------------"
  bash "$(dirname "$0")/$script"
done

echo ""
echo "======================================"
echo "Setup complete"
echo "======================================"
