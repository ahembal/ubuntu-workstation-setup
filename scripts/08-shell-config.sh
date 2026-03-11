#!/usr/bin/env bash
set -euo pipefail

ALIASES_FILE="${HOME}/.bash_aliases"

echo "[08-shell-config] Configuring shell aliases..."

touch "$ALIASES_FILE"

add_alias() {
  local alias_line="$1"
  if ! grep -Fxq "$alias_line" "$ALIASES_FILE"; then
    echo "$alias_line" >> "$ALIASES_FILE"
    echo "Added: $alias_line"
  else
    echo "Exists: $alias_line"
  fi
}

# Kubernetes aliases
add_alias "alias k=kubectl"
add_alias "alias kgp='kubectl get pods'"
add_alias "alias kgs='kubectl get svc'"
add_alias "alias kgd='kubectl get deployments'"
add_alias "alias kgn='kubectl get nodes'"
add_alias "alias kd='kubectl describe'"
add_alias "alias kaf='kubectl apply -f'"
add_alias "alias kdf='kubectl delete -f'"

# Extend with more aliases as needed

echo "[08-shell-config] Done."
echo "Reload your shell or run: source ~/.bashrc"
