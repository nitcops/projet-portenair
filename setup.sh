#!/bin/bash
dnf update -y
# 1. Installation des paquets de base et du dépôt EPEL
# On groupe tout pour gagner du temps
sudo dnf install -y curl podman epel-release
# 2. Installation de podman-compose (nécessite EPEL)
sudo dnf install -y podman-compose

sudo firewall-cmd --permanent --add-service={ssh,http,https}
# Ouvrir le port pour Nginx et Ouvrir le port pour Portainer
sudo firewall-cmd --permanent --add-port={8080/tcp,9443/tcp}
firewall-cmd --reload
# 4. Activation et démarrage des services
# podman.socket pour Portainer
sudo systemctl enable --now podman.socket

echo "--- Configuration terminée ! ---"
echo "Vérification du socket :"
sudo systemctl status podman.socket --no-pager

