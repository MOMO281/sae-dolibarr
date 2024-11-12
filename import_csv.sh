#!/bin/bash
# #!/bin/bash
# Importer des données CSV dans les tables Dolibarr
mysql -u test -p test123456789 -e "LOAD DATA INFILE './test.csv' INTO TABLE nom_table FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"
