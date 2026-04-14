# projet-portainer

pour ce projet j'ai choisi podman car j'utilise une distribution rockylinux docker n'étant pas antif j'ai privilégié donc un outil natif de plus
Podman permet le Rootless, mais pour ce lab technique, j'ai choisi le mode Root pour faciliter l'intégration de Portainer et la gestion des ports privilégiés (comme le port 80), tout en profitant de l'architecture sans démon qui diminue les risque de faire planté les conteneur car le processus parent étant plus haut dans le hiérarchie des pid la probabilité d'une panne diminue.

# prot privlégié ce sont les 1024 premier port qui demande souvent d'être root

prérequis
voici mon script de base à executé c'est simple et automatique vous avez jsute à copié coller dans un fichier vous pouvez même coller les commentaire il seront ignoré par le shell et ferais tous automatiquement l'installation des dépendance ainsi que les configuration de base.
<img width="823" height="504" alt="image" src="https://github.com/user-attachments/assets/40bc145a-f3f2-4860-bd90-2668ba53de85" />








Je vais déclaré dans mon fichier Docker-compose.yml mon conteneur nginx et portainer pour cela je déclare dans mon service 2 conteneur un portenaire avec le port 9443 comme ça je pourrais y accéder via l'ip de ma machine 192.168.222.136 dans mon cas pour vous il faudra vérifier avec ip -br a votre ip principal je vais également déclaré un volume pour que portainer puisse tracker podman, ici vous avez juste à executé mon script dockercompose.yml pas la peine de vous embéter avec mes explication technique.
<img width="816" height="506" alt="image" src="https://github.com/user-attachments/assets/8e49abeb-0ba4-4f45-b56b-e44a011ba7a4" />











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

