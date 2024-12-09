- MOREAU Morgan
- LIEBART Corentin


# Installation et Utilisation de Dolibarr avec Docker Compose

## Prérequis
- Docker installé sur votre machine.
- Docker Compose installé sur votre machine.
- Les scripts import_csv.sh et backup.sh et install.sh disponibles dans le répertoire principal.

## Lancer les conteneurs :

``` ./install.sh ```

## Accéder à Dolibarr :

Ouvrez un navigateur web et accédez à : http://localhost:8080
Identifiez-vous avec :
- Login : admin 
- Mot de passe : admin 

## Arrêter les conteneurs :

```docker-compose down```

## Importer des données depuis un fichier CSV
Un script import_csv.sh est fourni pour l'importation de données.

Script : import_csv.sh
- Pré-requis
Assurez-vous que le fichier test.csv est prêt et contient les données à importer.
- Lancer l'importation
Copiez le fichier test.csv dans le répertoire du script.

Exécutez le script :

```./import_csv.sh```

Le script se connecte à la base MariaDB et insère les données de test.csv dans la base de Dolibarr.


## Sauvegarder les données
Un script backup.sh est inclus pour sauvegarder les données.

Script : backup.sh
- Sauvegarder

Exécutez le script :

```./backup.sh```

Le script sauvegarde :
Les données MariaDB dans un fichier 
Les documents Dolibarr dans un répertoire spécifique.

- Restaurer

Pour restaurer, utilisez le fichier de sauvegarde généré et placez-le dans MariaDB.

