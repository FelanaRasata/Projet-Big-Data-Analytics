# Chargement des données dans MongoDB

## Description:

Un script pour importer des données CSV dans MongoDB.

1. **Mettre le CSV dans la machine virtuelle (VM)**

Mettez le fichier `Catalogue.csv` dans le chemin suivant : `/vagrant/tpa_groupe_14/data`

2. **Importer les données CSV dans les collections MongoDB.**

- Définition du jeu de caractères de `Catalogue.csv` CSV en UTF-8 et modification de certains caractères.

```bash
DS_PATH="/vagrant/tpa_groupe_14/data"

CATALOGUES_FILE_PATH="$DS_PATH/Catalogue.csv"
CATALOGUES_FILE_PATH_NEW="$DS_PATH/Catalogue_UTF8.csv"

iconv -f ISO-8859-1 -t UTF-8 $CATALOGUES_FILE_PATH -o $CATALOGUES_FILE_PATH_NEW

sed -i 's/ï/i/g' $CATALOGUES_FILE_PATH_NEW
```

- Import des données de `Catalogue.csv` dans la collection `catalogues`.

```bash
mongoimport --db sourceCSV --collection catalogue --type csv --file $CATALOGUES_FILE_PATH_NEW --headerline;
```
