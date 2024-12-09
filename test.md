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
```bash
git clone <URL_DU_DEPOT>
cd <NOM_DU_DEPOT>
2. Lancer Dolibarr et MariaDB
Pour démarrer Dolibarr et MariaDB via Docker Compose, exécutez le script install.sh :

bash
Copier le code
bash install.sh
Ce script utilise le fichier docker-compose.yml pour construire et démarrer les conteneurs nécessaires.

3. Importer des utilisateurs dans Dolibarr
Préparez un fichier CSV contenant les informations des utilisateurs au format suivant :

csv
Copier le code
firstname,lastname,email,login,password
John,Doe,john.doe@example.com,johndoe,password123
Jane,Smith,jane.smith@example.com,janesmith,secretpass
Alice,Johnson,alice.johnson@example.com,alicejohnson,alicepass
Bob,Martin,bob.martin@example.com,bobmartin,bobpass
Placez ce fichier CSV (par exemple test.csv) dans le répertoire principal, puis exécutez le script suivant pour importer les données :

bash
Copier le code
bash import_csv.sh
4. Sauvegarder la base de données et les fichiers
Pour effectuer une sauvegarde combinée de la base de données Dolibarr et des fichiers associés, exécutez :

bash
Copier le code
bash backup.sh
Les sauvegardes sont stockées dans le dossier backups avec un fichier nommé au format dolidb_backup_YYYYMMDDHHMMSS.csv. Ce fichier contient :

Les informations des utilisateurs (extraites de la base de données).
Les métadonnées des fichiers présents dans les répertoires Dolibarr (dolibarr_documents et dolibarr_custom).
