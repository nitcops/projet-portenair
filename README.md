# projet-portainer

pour ce projet j'ai choisi podman car j'utilise une distribution rockylinux docker n'étant pas antif j'ai privilégié donc un outil natif de plus
Podman permet le Rootless, mais pour ce lab technique, j'ai choisi le mode Root pour faciliter l'intégration de Portainer et la gestion des ports privilégiés (comme le port 80), tout en profitant de l'architecture sans démon qui diminue les risque de faire planté les conteneur car le processus parent étant plus haut dans le hiérarchie des pid la probabilité d'une panne diminue.

# prot privlégié ce sont les 1024 premier port qui demande souvent d'être root

accès aux welcome nginx après mon démarrage podman-compose
<img width="1135" height="519" alt="image" src="https://github.com/user-attachments/assets/c945de08-b69e-41c3-a99c-9aaf5946b996" />


Projet portainer

crée votre compte portainer
<img width="1330" height="916" alt="image" src="https://github.com/user-attachments/assets/83c5ac3a-68a6-4c18-8b33-1db6c8574613" />

<img width="1889" height="791" alt="image" src="https://github.com/user-attachments/assets/e46b573c-01fa-4f79-a915-70bdd9ba3bd7" />

pour Ajouter podman à l'environnement portnainer pour pouvoir l'avoir en tableau de bord plus tard cliquez sur podman
<img width="1503" height="847" alt="image" src="https://github.com/user-attachments/assets/ab89bf77-9552-48d0-8d48-6462a967e495" />
donner lui un nom ici rocky-lab
<img width="1355" height="819" alt="image" src="https://github.com/user-attachments/assets/4ed01ba2-47e3-4364-8878-d479706e88a4" />

<img width="563" height="652" alt="image" src="https://github.com/user-attachments/assets/55dae888-b120-48bc-9d52-1ea018e5c3dc" />
