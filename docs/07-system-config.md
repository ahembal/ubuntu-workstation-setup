# 07 — System Configuration

Post-install system configuration for a development workstation.

## Enable UFW firewall

# Ubuntu ships with UFW but it is usually inactive by default.
sudo ufw enable

# Check firewall status
sudo ufw status


## Enable SSH server (optional)

# Useful if you want to access the workstation remotely.
sudo apt install -y openssh-server

# Verify SSH service
sudo systemctl status ssh


## Verify Docker group membership

# After adding user to docker group earlier, verify it:
groups

# If docker group is listed, Docker can run without sudo
# You may need to log out and log back in for this to take effect.

