#!/bin/bash
# #!/bin/bash
# Importer des données CSV dans les tables Dolibarr
mysql -u dolidbuser -p dolidbpass -e "LOAD DATA INFILE './test.csv' INTO TABLE llx_societe FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;"
