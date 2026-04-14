# projet-portainer

ici je vais vous présenter un petit projet ou j'installe un serveur web nginx de façon trés automatisé vous pouvez passer l'introduction et juste suivre les étape d'installation en commençant par les prérequis et en suivant la procédure même quelqu'un qui n'est pas du domaine pourrais effectuer cette tache tant elle est simplifié le principe de ce projet et donc de montré la simplification de l'installation et la gestion de ce serveur via l'automatisation de l'installation de ce serveur et d'une interface graphique pour ça gestion.

Introduction :
pour ce projet j'ai choisi podman car j'utilise une distribution rockylinux docker n'étant pas natif j'ai privilégié donc un outil natif de plus
Podman permet le Rootless, mais pour ce lab technique, j'ai choisi le mode Root pour faciliter l'intégration de Portainer et la gestion des ports privilégiés (comme le port 80), tout en profitant de l'architecture sans démon qui diminue les risque de faire planté les conteneur car le processus parent étant plus haut dans le hiérarchie des pid la probabilité d'une panne diminue.

# port privlégié ce sont les 1024 premier port qui demande souvent d'être root

prérequis
voici mon script de base à executé c'est simple et automatique vous avez jsute à copié coller dans un fichier vous pouvez même coller les commentaire il seront ignoré par le shell et ferais tous automatiquement l'installation des dépendance ainsi que les configuration de base.

vi setup.sh
puis une fois que mon script est coller faite un échap :wq # une fois que vous appuyé sur échap vi entre en mode commande et vous verrez apparaitre en bas vos saisie ne paniqué si cela ne marche pas ou si vous avez fait une faut de frappe refaire échap puis : puis w puis q comme vu sur ma capture en bas puis appuyé sur entré
<img width="820" height="514" alt="image" src="https://github.com/user-attachments/assets/8be057d6-5eb0-426c-8f93-edd7f2cb5069" />
chmod +x setup.sh # commande pour rendre le script executable
./setup.sh # commande pour executé le script







Je vais déclaré dans mon fichier Docker-compose.yml mon conteneur nginx et portainer pour cela je déclare dans mon service 2 conteneur un portenaire avec le port 9443 comme ça je pourrais y accéder via l'ip de ma machine 192.168.222.136 dans mon cas pour vous il faudra vérifier avec ip -br a votre ip principal je vais également déclaré un volume pour que portainer puisse tracker podman, ici vous avez juste à executé mon script dockercompose.yml pas la peine de vous embéter avec mes explication technique.

tapé podman-compose up -d
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

