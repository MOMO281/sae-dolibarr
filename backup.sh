#!/bin/bash

# Paramètres de la base de données
DB_HOST="172.18.0.1"
DB_NAME="dolidb"
DB_USER="root"
DB_PASS="root"
BACKUP_DIR="/home/backups/dolibarr"  # Dossier local de sauvegarde
DATE=$(date +"%Y%m%d_%H%M%S")        # Format de date pour nommer les sauvegardes

# Dossier pour la sauvegarde de la base de données et des fichiers
DB_BACKUP="${BACKUP_DIR}/dolidb_${DATE}.sql"
FILES_BACKUP="${BACKUP_DIR}/dolibarr_files_${DATE}.tar.gz"

# Créer un répertoire de sauvegarde s'il n'existe pas
mkdir -p "$BACKUP_DIR"

# Sauvegarde de la base de données MySQL
echo "Sauvegarde de la base de données..."
mysqldump -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$DB_BACKUP"

# Sauvegarde des fichiers Dolibarr
echo "Sauvegarde des fichiers Dolibarr..."
tar -czf "$FILES_BACKUP" /home/dolibarr_documents /home/dolibarr_custom

# Sauvegarde sur un serveur distant ou Cloud
# Exemple avec rsync (serveur distant)
REMOTE_SERVER="user@remote_server:/path/to/backup/folder/"
echo "Transfert des sauvegardes vers le serveur distant..."
rsync -avz "$BACKUP_DIR" "$REMOTE_SERVER"

# Exemple avec AWS S3 (Cloud)
# aws s3 cp "$DB_BACKUP" s3://your-bucket-name/backups/
# aws s3 cp "$FILES_BACKUP" s3://your-bucket-name/backups/

echo "Sauvegarde terminée le $DATE"

