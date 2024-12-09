# Déploiement de Dolibarr avec MariaDB

Ce dépôt contient tous les fichiers nécessaires pour déployer Dolibarr et MariaDB avec Docker Compose, importer des utilisateurs dans la base de données et effectuer des sauvegardes.

## Prérequis

Assurez-vous d'avoir les outils suivants installés sur votre machine :
- **Docker**
- **Docker Compose**
- **Bash** (pour exécuter les scripts shell)
- **Git**

## Contenu du dépôt

Ce dépôt contient les fichiers suivants :

- **`docker-compose.yml`** : Décrit la configuration des services Docker pour Dolibarr et MariaDB.
- **`install.sh`** : Script permettant de lancer les services Docker.
- **`import_csv.sh`** : Script pour importer des utilisateurs à partir d'un fichier CSV dans la base de données Dolibarr.
- **`backup.sh`** : Script pour sauvegarder la base de données Dolibarr et les fichiers.
- **`test.csv`** : Exemple de fichier CSV contenant des utilisateurs à importer.

## Étapes d'installation et d'utilisation

### 1. Cloner le dépôt

Clonez le dépôt Git sur votre machine locale :
git clone git@github.com:MOMO281/sae-dolibarr.git

cd sae-dolibarr

### 2. Lancer Dolibarr et MariaDB

Pour démarrer Dolibarr et MariaDB via Docker Compose, exécutez le script install.sh :

bash
./install.sh

Ce script utilise le fichier docker-compose.yml pour construire et démarrer les conteneurs nécessaires.

### 3. Importer des utilisateurs dans Dolibarr
Préparez un fichier CSV contenant les informations des utilisateurs au format suivant csv
Éxécutez ensuite la commande :

bash
./import_csv.sh

### 4. Sauvegarder la base de données et les fichiers

Pour effectuer une sauvegarde combinée de la base de données Dolibarr et des fichiers associés, exécutez :

bash
./backup.sh

Les sauvegardes sont stockées dans le dossier backups avec un fichier nommé au format dolidb_backup_YYYYMMDDHHMMSS.csv. Ce fichier contient :

Les informations des utilisateurs (extraites de la base de données).
Les métadonnées des fichiers présents dans les répertoires Dolibarr (dolibarr_documents et dolibarr_custom).
