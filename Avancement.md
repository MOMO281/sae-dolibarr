- Liébart Corentin
- Moreau Morgan

# Journal de Projet SAÉ Dolibarr

## 05/11/2024 (14h30 - 17h30)
- **Installation de la VM**
- **Création du dépôt Git** : `sae-dolibarr`
- **Documentation sur Dolibarr**

## 06/11/2024 (8h30 - 11h30)
- **Installation de Dolibarr** :
  - Problèmes rencontrés avec `wget` : impossible de décompresser l'archive téléchargée.
- **Installation de Docker** :
  - Utilisation de Docker pour exécuter une image Dolibarr via Docker Compose.

## 07/11/2024 (8h30 - 19h)
- **Création d'un fichier `docker-compose.yml`** pour lancer l'image Dolibarr.
- **Création des scripts `install.sh` et `import_csv.sh`**.
- **Création d'un fichier `test.csv`** pour les tests.
- **Tentative d'importation des données du fichier `test.csv`** :
  - Accès refusé (`Access Denied`) lors de l'importation.
  - Recherche de solutions pour corriger ce problème.

## 12/11/2024 (8h30 - 11h30)
- **Création d'un utilisateur dolibarr `test` avec mdp `test123456789`**
  - Changement des droits de cet utilisateur pour qu'il puisse importer des données 
- **Changement du mdp de l'utilisateur mySQL `root` en `root`**

## 04/12/2024 (8h30 - 11h30)
- Résolution des problèmes
- **Création d'un script `backup.sh`** afin de faire des sauvegardes des données
- **Modification du `import_csv.sh` et du  `docker-compose.yml`  afin de résussir a importer des données
