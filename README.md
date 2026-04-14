Présentation du projet

Ce projet consiste en l'automatisation complète du déploiement d'un serveur web Nginx sur Rocky Linux. L'objectif est de démontrer comment l'automatisation permet de simplifier des tâches d'administration système complexes, rendant l'installation accessible même à un profil non technique.

Points clés du projet :

    Automatisation : Installation des dépendances et configuration via un script Bash unique.

    Gestion simplifiée : Mise en place de l'interface graphique Portainer pour piloter les conteneurs.

    Sécurité et Stabilité : Utilisation de Podman (natif sur Rocky Linux) pour sa gestion robuste des processus.

Choix techniques : Pourquoi Podman ?

Sur Rocky Linux, Docker n'est pas installé par défaut. J'ai donc privilégié Podman, l'outil natif de l'écosystème Red Hat.

    Architecture sans démon (Daemonless) : Contrairement à Docker, Podman n'utilise pas de processus central (démon). Cela réduit les points de défaillance : si le processus parent s'arrête, cela n'impacte pas forcément tous les conteneurs de la même manière.

    Mode Root : Bien que Podman permette le "Rootless", j'ai choisi le mode Root pour ce lab afin de faciliter l'exposition des ports privilégiés (ports 0 à 1024) nécessaires pour le serveur web (Port 80).





vi setup.sh

<img width="820" height="514" alt="image" src="https://github.com/user-attachments/assets/8be057d6-5eb0-426c-8f93-edd7f2cb5069" />

Pour rendre le script exécutable et le lancer, utilisez les commandes suivantes :
chmod +x setup.sh 
./setup.sh 



Déploiement de l'infrastructure (Podman-Compose)

Une fois le système préparé par le script, nous allons déployer les services via un fichier docker-compose.yml. Ce fichier déclare deux conteneurs :

    Nginx : Serveur web accessible sur le port 8080.

    Portainer : Interface de gestion accessible sur le port 9443.

    Note : J'ai configuré un volume pour mapper le socket de Podman (/run/podman/podman.sock) vers celui de Docker dans le conteneur Portainer. Cela permet à Portainer de piloter directement le moteur de conteneurs Podman.

Pour lancer l'infrastructure :
Vérifiez d'abord votre adresse IP avec la commande ip -br a. Ensuite, lancez la commande suivante dans le dossier contenant le fichier YAML :
podman-compose up -d

<img width="812" height="508" alt="image" src="https://github.com/user-attachments/assets/788a65e8-af4c-4813-8719-6e3d812b6750" />

une derniére commande 
sentenforce 0
ce n'est pas une bonne partique cela désactive selinux mais pour ce lab on va ce concentré sur la gestion de nos contenaire podman via portainer 








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

