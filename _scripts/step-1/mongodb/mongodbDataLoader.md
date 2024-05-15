# Partie MongoDB

## Description:

Un script pour importer des données CSV dans MongoDB.

1. **Mettre le CSV dans la machine virtuelle (VM)**

Mettez les fichiers `Immatriculations.csv` et `Catalogue.csv` dans le chemin suivant : `/vagrant/tpa_groupe_14/data`

2. **Importer les données CSV dans les collections MongoDB.**

- Créez une variable contenant le chemin des fichiers CSV.

```bash
DS_PATH="/vagrant/tpa_groupe_14/data"

immatriculations_file="$DS_PATH/Immatriculations.csv"
catalogues_file="$DS_PATH/Catalogue.csv"

```

- Définissez le jeu de caractères des fichiers CSV en UTF-8 et modifiez certains caractères.

```bash
immatriculations_file_new="$DS_PATH/Immatriculations_UTF8.csv"
catalogues_file_new="$DS_PATH/Catalogue_UTF8.csv"

iconv -f ISO-8859-1 -t UTF-8 $immatriculations_file -o $immatriculations_file_new
iconv -f ISO-8859-1 -t UTF-8 $catalogues_file -o $catalogues_file_new

sed -i 's/ï/i/g' $catalogues_file_new
```

- Importez des données depuis `Immatriculations.csv` dans la collection `immatriculations`.

```bash
mongoimport --db sourceCSV --collection immatriculations --type csv --file $immatriculations_file_new --headerline
```

- Importez des données depuis `Catalogue.csv` dans la collection `catalogues`.

```bash
mongoimport --db sourceCSV --collection catalogues --type csv --file $catalogues_file_new --headerline;
```
