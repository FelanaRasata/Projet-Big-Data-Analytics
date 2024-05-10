# MongoDB Part

## Description:

A script to import CSV data into MongoDB

1. **Put CSV in VM**

Put `Immatriculations.csv` & `Catalogue.csv` in the following path: `/vagrant/tpt/data`

2. **Import CSV data into MongoDB collections**

\*INSTRUCTION: Replace $DS_PATH with the actual file paths

- Create a variable that contains the path of csv file

```bash
$ DS_PATH="/vagrant/tpt/data"

$ immatriculations_file="$DS_PATH/Immatriculations.csv"
$ catalogues_file="$DS_PATH/Catalogue.csv"
```

- Importing data from `Immatriculations.csv` into `immatriculations` collection

```bash
$ mongoimport --db sourceCSV --collection immatriculations --type csv --file $immatriculations_file --headerline;
```

- Importing data from `Catalogue.csv` into `catalogues` collection

```bash
$ mongoimport --db sourceCSV --collection catalogues --type csv --file $catalogues_file --headerline;
```
