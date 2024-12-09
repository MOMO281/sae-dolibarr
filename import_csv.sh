#!/bin/bash

# Configuration de la base de données
DB_HOST="172.18.0.1"            # Hôte de la base de données
DB_NAME="dolidb"                # Nom de la base de données Dolibarr
DB_USER="root"                  # Utilisateur de la base de données
DB_PASS="root"                  # Mot de passe de la base de données (vide si nécessaire)
CSV_FILE="test.csv"             # Fichier CSV contenant les utilisateurs

# Vérification si le fichier CSV existe
if [[ ! -f "$CSV_FILE" ]]; then
  echo "Erreur : Le fichier CSV '$CSV_FILE' n'existe pas."
  exit 1
fi

# Lire le fichier CSV et insérer chaque utilisateur dans la base de données
while IFS=',' read -r firstname lastname email login password
do
  # Ignorer la ligne d'en-tête
  if [[ "$firstname" == "firstname" ]]; then
    continue
  fi

  # Diagnostic : afficher les valeurs lues pour chaque ligne
  echo "Lire ligne : '$firstname' '$lastname' '$email' '$login' '$password'"

  # Vérification des champs requis
  if [[ -z "$firstname" || -z "$lastname" || -z "$email" || -z "$login" || -z "$password" ]]; then
    echo "Erreur : Des champs sont vides pour l'utilisateur $email. Ligne ignorée."
    continue
  fi

  # Hachage du mot de passe (adapté à la base de données Dolibarr)
  hashed_password=$(echo -n "$password" | openssl dgst -sha256)

  # Préparer la requête d'insertion dans la table llx_user
  QUERY="INSERT INTO llx_user (firstname, lastname, login, pass, email, statut, datec)
         VALUES ('$firstname', '$lastname', '$login', '$hashed_password', '$email', 1, NOW());"

  # Exécuter la requête SQL pour insérer l'utilisateur
  echo "$QUERY" | mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME"

  if [ $? -eq 0 ]; then
    echo "Utilisateur $email ajouté avec succès."
  else
    echo "Erreur lors de l'ajout de l'utilisateur $email."
  fi

done < "$CSV_FILE"

echo "Importation terminée."

