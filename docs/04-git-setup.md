# 04 — Git Setup

Configure Git identity and authentication for development work.

## Set Git identity

git config --global user.name "GIT_USER_NAME"
git config --global user.email "GIT_USER_EMAIL"

## Recommended defaults

git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.editor nano

## Verify configuration

git config --list


# SSH Setup

Using SSH keys allows secure authentication with Git providers.

## Generate SSH key

ssh-keygen -t ed25519 -C "your.email@example.com"

## Start ssh-agent

eval "$(ssh-agent -s)"

## Add key to agent

ssh-add ~/.ssh/id_ed25519

## Show public key (copy this to GitHub/GitLab)

cat ~/.ssh/id_ed25519.pub
