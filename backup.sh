#!/bin/bash

# Configuration de la base de données
DB_HOST="172.18.0.1"          # Hôte de la base de données
DB_NAME="dolidb"              # Nom de la base de données
DB_USER="root"                # Utilisateur de la base de données
DB_PASS="root"                # Mot de passe de la base de données
BACKUP_DIR="backups"  # Dossier de sauvegarde local
DATE=$(date +'%Y%m%d%H%M%S')  # Date et heure actuelles pour le nom du fichier

# Créer le dossier de sauvegarde s'il n'existe pas
mkdir -p "$BACKUP_DIR"

# Définir le nom du fichier CSV combiné
CSV_FILE="$BACKUP_DIR/dolidb_backup_$DATE.csv"

# Créer l'en-tête du fichier CSV combiné
echo "type,firstname,lastname,email,login,statut,datec,file_path,modified_time" > "$CSV_FILE"

# Exporter les utilisateurs de la base de données et les ajouter au CSV
echo "Exportation des utilisateurs..."

# Exécuter la requête pour récupérer les utilisateurs
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e \
"SELECT 'user', firstname, lastname, email, login, statut, datec FROM llx_user" \
| tail -n +2 >> "$CSV_FILE"  # Ignore la première ligne (entêtes de la commande mysql)

# Exporter la liste des fichiers et les ajouter au CSV
echo "Exportation des fichiers..."

# Lister les fichiers dans dolibarr_documents et dolibarr_custom et les ajouter au CSV
for dir in /home/dolibarr_documents /home/dolibarr_custom; do
  find "$dir" -type f -exec stat --format="file,$(basename {}),,%n,%y" {} \; \
  >> "$CSV_FILE"
done

# Vérifier si tout s'est bien passé
if [ $? -eq 0 ]; then
  echo "Sauvegarde combinée réussie : $CSV_FILE"
else
  echo "Erreur lors de la sauvegarde."
fi

