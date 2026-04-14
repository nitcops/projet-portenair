#!/bin/bash
dnf update
dnf install curl && git
firewall-cmd --zone=public --add-service=ssh --permanent
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-service=https --permanent
# Ouvrir le port pour Nginx
sudo firewall-cmd --add-port=8080/tcp --permanent
# Ouvrir le port pour Portainer
sudo firewall-cmd --add-port=9443/tcp --permanent
firewall-cmd --reload
dnf install podman
# 1. Installer le dépôt EPEL (indispensable sur Rocky/RHEL)
sudo dnf install epel-release -y
# 2. Rafraîchir les dépôts
sudo dnf makecache
# 3. Installer podman-compose
sudo dnf install podman-compose -y
systemctl enable --now podman.socket
