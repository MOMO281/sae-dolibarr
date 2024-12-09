MOREAU Morgan
LIEBART Corentin


# Installation et Utilisation de Dolibarr avec Docker Compose

## Prérequis
- Docker installé sur votre machine.
- Docker Compose installé sur votre machine.
- Les scripts import_csv.sh et backup.sh disponibles dans le répertoire principal.

## Configuration
Votre configuration est définie dans un fichier docker-compose.yml. Ce fichier configure deux services :

MariaDB : Base de données pour Dolibarr.
Dolibarr : Application principale.
Dossiers utilisés
/home/dolibarr_mariadb : Contient les données de la base MariaDB.
/home/dolibarr_documents : Contient les documents Dolibarr.
/home/dolibarr_custom : Contient les fichiers personnalisés Dolibarr.
Variables d'environnement principales
DOLI_DB_HOST : Hôte de la base de données.
DOLI_DB_NAME : Nom de la base de données.
DOLI_DB_USER : Utilisateur de la base de données.
DOLI_DB_PASSWORD : Mot de passe de la base de données.
DOLI_ADMIN_LOGIN : Identifiant administrateur Dolibarr.
DOLI_ADMIN_PASSWORD : Mot de passe administrateur Dolibarr.
Lancer Dolibarr
Lancer les conteneurs :


''' ./install.sh '''

## Accéder à Dolibarr :

Ouvrez un navigateur web et accédez à : http://localhost:8080
Identifiez-vous avec :
- Login : admin (ou la valeur de DOLI_ADMIN_LOGIN si modifiée).
- Mot de passe : admin (ou la valeur de DOLI_ADMIN_PASSWORD si modifiée).

##Arrêter les conteneurs :


docker-compose down

## Importer des données depuis un fichier CSV
Un script import_csv.sh est fourni pour automatiser l'importation de données.

Script : import_csv.sh
Pré-requis
Assurez-vous que le fichier test.csv est prêt et contient les données à importer.
Lancer l'importation
Copiez le fichier test.csv dans le répertoire du script.
Exécutez le script :

./import_csv.sh

Le script se connecte à la base MariaDB et insère les données de test.csv dans la base de Dolibarr.


## Sauvegarder les données
Un script backup.sh est inclus pour sauvegarder les données.

Script : backup.sh
Sauvegarder
Exécutez le script :

./backup.sh

Le script sauvegarde :
Les données MariaDB dans un fichier .sql.
Les documents Dolibarr dans un répertoire spécifique.
Restaurer
Pour restaurer, utilisez le fichier de sauvegarde généré et placez-le dans MariaDB.







