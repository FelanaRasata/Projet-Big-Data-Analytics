# Chargement des données dans HDFS (Hadoop)

## Description:

Scripts pour téléverser les fichiers csv vers Hadoop HDFS

## Prérequis : Hadoop installé et configuré

1. **Démarrage de Hadoop HDFS**

```bash
start-dfs.sh
```

2. **Mettre le fichier CO2.csv dans Hadoop HDFS**

- Chemin du fichier: `/vagrant/tpa_groupe_14/data`

```bash
DS_PATH="/vagrant/tpa_groupe_14/data"

# Définir les chemins des fichiers
CO2_FILE_PATH="$DS_PATH/CO2.csv"
IMMATRICULATIONS_FILE_PATH="$DS_PATH/Immatriculations.csv"
```

- Définition du jeu de caractères de `Immatriculations.csv` en UTF-8.

```bash
IMMATRICULATIONS_FILE_PATH_NEW="$DS_PATH/Immatriculations_UTF8.csv"

iconv -f ISO-8859-1 -t UTF-8 $IMMATRICULATIONS_FILE_PATH -o $IMMATRICULATIONS_FILE_PATH_NEW
```

- Création des dossiers respectifs aux fichiers.

```bash
hadoop fs -mkdir -p /tpa_groupe_14/data/co2
hadoop fs -mkdir -p /tpa_groupe_14/data/immatriculation
```

- Copie des fichiers dans Hadoop HDFS.

```bash
hadoop fs -put -f $CO2_FILE_PATH /tpa_groupe_14/data/co2
hadoop fs -put -f $IMMATRICULATIONS_FILE_PATH_NEW /tpa_groupe_14/data/immatriculation
```
