# MongoDB Part

## Description:

A script to import CSV data into MongoDB

1. **Put CSV in VM**

Put `Immatriculations.csv` & `Catalogue.csv` in the following path: `/vagrant/tpa_groupe_14/data`

2. **Import CSV data into MongoDB collections**

\*INSTRUCTION: Replace $DS_PATH with the actual file paths

- Create a variable that contains the path of csv file

```bash
DS_PATH="/vagrant/tpa_groupe_14/data"

immatriculations_file="$DS_PATH/Immatriculations.csv"
catalogues_file="$DS_PATH/Catalogue.csv"


immatriculations_file_new="$DS_PATH/Immatriculations_UTF8.csv"
catalogues_file_new="$DS_PATH/Catalogue_UTF8.csv"

iconv -f ISO-8859-1 -t UTF-8 $immatriculations_file -o $immatriculations_file_new

iconv -f ISO-8859-1 -t UTF-8 $catalogues_file -o $catalogues_file_new
```

- Importing data from `Immatriculations.csv` into `immatriculations` collection

```bash
mongoimport --db sourceCSV --collection immatriculations --type csv --file $immatriculations_file_new --headerline
```

- Importing data from `Catalogue.csv` into `catalogues` collection

```bash
mongoimport --db sourceCSV --collection catalogues --type csv --file $catalogues_file_new --headerline;
```
