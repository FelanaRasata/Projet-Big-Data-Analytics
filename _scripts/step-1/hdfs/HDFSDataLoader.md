# Partie de l'Hadoop HDFS

## Description:

Un script pour télécharger des fichiers csv vers Hadoop HDFS

## Prérequis : Hadoop installé et configuré

1. **Démarrage de Hadoop HDFS**

```bash
start-dfs.sh
```

2. **Mettre le fichier CO2.csv dans Hadoop HDFS**

   Mettez le fichier "CO2.csv" dans le chemin suivant: `/vagrant/tpa_groupe_14/data`

- Créez une variable qui contient le chemin du fichier "CO2.csv".

```bash
DS_PATH="/vagrant/tpa_groupe_14/data"

CO2_file="$DS_PATH/CO2.csv"
```

- Créez un dossier pour y mettre le fichier dans Hadoop HDFS.

```bash
hadoop fs -mkdir -p /tpa_groupe_14/data
```

- Mettez le fichier dans Hadoop HDFS.

```bash
hadoop fs -put -f $CO2_file /tpa_groupe_14/data
```
