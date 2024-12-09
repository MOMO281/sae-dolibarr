#!/bin/bash

# Define the path to your test.csv and MariaDB credentials
CSV_FILE="./test.csv"
MYSQL_HOST="172.18.0.1"
MYSQL_USER="${MYSQL_USER:-dolidbuser}"
MYSQL_PASSWORD="${MYSQL_PASSWORD:-dolidbpass}"
MYSQL_DB="${MYSQL_DATABASE:-dolidb}"

# Example: Import the CSV file into a Dolibarr table (adjust the table name and columns as needed)
TABLE_NAME="llx_user"  # Replace with the appropriate Dolibarr table
FIELDS_TERMINATED_BY=","
ENCLOSED_BY='"'

# Commande pour importer un CSV
mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASSWORD --local-infile=1 $MYSQL_DB <<EOF
LOAD DATA LOCAL INFILE '$CSV_FILE'
INTO TABLE $TABLE_NAME
FIELDS TERMINATED BY '$FIELDS_TERMINATED_BY'
ENCLOSED BY '$ENCLOSED_BY'
IGNORE 1 LINES;
EOF

# Optionally, you can verify if the data is imported by running a simple SELECT query.
mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASSWORD $MYSQL_DB -e "SELECT * FROM $TABLE_NAME LIMIT 10;"

echo "Import complete."

