# Description: A script to import CSV data into MongoDB

# CSV : Immatriculations.csv, Catalogue.csv
# Path : /vagrant/tpt/data

# *INSTRUCTION: Replace $DS_PATH with the actual file paths
DS_PATH="/vagrant/tpt/data"

# Import CSV data into MongoDB collections

immatriculations_file="$DS_PATH/Immatriculations.csv"
catalogues_file="$DS_PATH/Catalogue.csv"

# Importing data from Immatriculations.csv into 'immatriculations' collection
mongoimport --db sourceCSV --collection immatriculations --type csv --file $immatriculations_file --headerline;

# Importing data from Catalogue.csv into 'catalogues' collection
mongoimport --db sourceCSV --collection catalogues --type csv --file $catalogues_file --headerline;
