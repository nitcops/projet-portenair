# projet-portainer

pour ce projet j'ai choisi podman car j'utilise une distribution rockylinux docker n'étant pas antif j'ai privilégié donc un outil natif de plus
Podman permet le Rootless, mais pour ce lab technique, j'ai choisi le mode Root pour faciliter l'intégration de Portainer et la gestion des ports privilégiés (comme le port 80), tout en profitant de l'architecture sans démon qui diminue les risque de faire planté les conteneur car le processus parent étant plus haut dans le hiérarchie des pid la probabilité d'une panne diminue.

# prot privlégié ce sont les 1024 premier port qui demande souvent d'être root

voici mon script de base à executé c'est simple et automatique vous avez jsute à copié coller dans un fichier vous pouvez même coller les commentaire il seront ignoré par le shell et ferais tous automatiquement.
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

et voici mon script/fichier podman-compose ou plutôt docker-compose mais avec podman
version: '3'

services:
  mon-nginx:
    image: nginx:latest
    ports:
      - "8080:80"  # Accès via http://IP-de-ton-Rocky:8080

  mon-portainer:
    image: portainer/portainer-ce:latest
    ports:
      - "9443:9443" # Accès via https://IP-de-ton-Rocky:9443
    volumes:
      - /run/podman/podman.sock:/var/run/docker.sock # Donne à Portainer l'accès à Podman
      - portainer_data:/data

volumes:
  portainer_data:






accès aux welcome nginx après mon démarrage podman-compose
<img width="1135" height="519" alt="image" src="https://github.com/user-attachments/assets/c945de08-b69e-41c3-a99c-9aaf5946b996" />


Projet portainer

crée votre compte portainer
<img width="1330" height="916" alt="image" src="https://github.com/user-attachments/assets/83c5ac3a-68a6-4c18-8b33-1db6c8574613" />

si comme moi il ne s'ajoute pas tous seul à l'environnment portenaire cliquez sur add environnement
<img width="1889" height="791" alt="image" src="https://github.com/user-attachments/assets/e46b573c-01fa-4f79-a915-70bdd9ba3bd7" />

pour Ajouter podman à l'environnement portnainer pour pouvoir l'avoir en tableau de bord plus tard cliquez sur podman
<img width="1503" height="847" alt="image" src="https://github.com/user-attachments/assets/ab89bf77-9552-48d0-8d48-6462a967e495" />

donner lui un nom ici rocky-lab
<img width="1355" height="819" alt="image" src="https://github.com/user-attachments/assets/4ed01ba2-47e3-4364-8878-d479706e88a4" />

cliquez get started
<img width="563" height="652" alt="image" src="https://github.com/user-attachments/assets/55dae888-b120-48bc-9d52-1ea018e5c3dc" />

et voila vous avez votre environnment en graphique vous pouvez mainteant géré vos conteneur odman graphiquement sasn avoir à tapé de ligne de commande
<img width="1511" height="564" alt="image" src="https://github.com/user-attachments/assets/220e4cb6-6576-4ff6-81a0-ab80dd392d7c" />

