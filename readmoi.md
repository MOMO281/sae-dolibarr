# Documentation complète pour l'installation, l'importation et la gestion des sauvegardes de Dolibarr

Cette documentation fournit un guide détaillé sur l'installation de **Dolibarr**, l'importation de données à partir d'un fichier **CSV**, et la gestion des **sauvegardes automatisées**.

## Table des matières

1. [Prérequis](#prérequis)
2. [Installation de Dolibarr via Docker](#installation-de-dolibarr-via-docker)
   - [Démarrer Dolibarr](#démarrer-dolibarr)
3. [Importer des Données via un Fichier CSV](#importer-des-données-via-un-fichier-csv)
   - [Préparer le fichier CSV](#préparer-le-fichier-csv)
   - [Exécuter le script d'importation](#exécuter-le-script-dimportation)
4. [Configurer les Sauvegardes Automatisées](#configurer-les-sauvegardes-automatisées)
   - [Planifier les sauvegardes avec cron](#planifier-les-sauvegardes-avec-cron)
   - [Restaurer une sauvegarde](#restaurer-une-sauvegarde)
5. [Conclusion](#conclusion)

---

## Prérequis

Avant de commencer, vous devez vous assurer que les éléments suivants sont installés sur votre machine :

- **Docker** et **Docker Compose** : pour configurer et exécuter des conteneurs.
- **MySQL Client** (ou un autre client SQL) : pour interagir avec la base de données MariaDB via la ligne de commande.
- **Bash** : pour exécuter des scripts automatisés pour l'importation et la gestion des sauvegardes.

---

## Installation de Dolibarr via Docker

### Démarrer Dolibarr

1. **Clonez ou placez les fichiers Docker Compose** dans un répertoire spécifique.

   Si vous n'avez pas encore de fichier `docker-compose.yml`, vous pouvez en créer un avec la configuration nécessaire pour Dolibarr et MariaDB.

2. **Lancer Docker Compose** :

   Allez dans le répertoire où vous avez placé le fichier `docker-compose.yml` et lancez les commandes suivantes :

   ```bash
   docker-compose up -d

