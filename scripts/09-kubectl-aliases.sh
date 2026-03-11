#!/usr/bin/env bash
set -euo pipefail

ALIAS_FILE="${HOME}/.kubectl_aliases"

echo "[09-kubectl-aliases] Installing kubectl aliases..."

curl -fsSL \
https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases \
-o "$ALIAS_FILE"

echo "[09-kubectl-aliases] Installed at $ALIAS_FILE"

BASHRC="${HOME}/.bashrc"

if ! grep -q "kubectl_aliases" "$BASHRC"; then
  echo "" >> "$BASHRC"
  echo "# kubectl aliases" >> "$BASHRC"
  echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> "$BASHRC"
  echo "[09-kubectl-aliases] Added source line to .bashrc"
else
  echo "[09-kubectl-aliases] Already configured in .bashrc"
fi

echo "[09-kubectl-aliases] Done."
echo "Reload shell with: source ~/.bashrc"
