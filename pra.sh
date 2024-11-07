#!/bin/bash
TIMESTAMP=$(date +"%F")
BACKUP_DIR="/backup/$TIMESTAMP"
mkdir -p "$BACKUP_DIR"
# Sauvegarde de la base de données
mysqldump -u dolibarruser -p'motdepasse' dolibarr > "$BACKUP_DIR/dolibarr.sql"
# Sauvegarde des fichiers Dolibarr
tar -czvf "$BACKUP_DIR/dolibarr_files.tar.gz" /var/www/html/dolibarr

