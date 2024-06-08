# Etape 1 : Création Datalake
# A. Chargement des données

- Chemin des fichiers .csv: `/vagrant/tpa_groupe_14/data`

- Définir une variable qui contient la localisation des données .csv

```bash
DS_PATH="/vagrant/tpa_groupe_14/data"
```

## I. HDFS (Hadoop)

### Description:

Scripts pour téléverser les fichiers .csv vers Hadoop HDFS

### Prérequis : Hadoop installé et configuré

1. **Démarrage de Hadoop HDFS**

```bash
start-dfs.sh
```

2. **Mettre le fichier CO2.csv dans Hadoop HDFS**

- Définition les chemins des fichiers `CO2.csv` et `Immatriculations.csv`

```bash
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

## II. MongoDB

### Description:

Un script pour importer des données CSV dans MongoDB.

1. **Importer les données CSV dans les collections MongoDB.**

- Le fichier `Catalogue.csv` est dans le chemin suivant : `/vagrant/tpa_groupe_14/data`

- Définition du jeu de caractères de `Catalogue.csv` CSV en UTF-8 et modification de certains caractères.

```bash
CATALOGUES_FILE_PATH="$DS_PATH/Catalogue.csv"
CATALOGUES_FILE_PATH_NEW="$DS_PATH/Catalogue_UTF8.csv"

iconv -f ISO-8859-1 -t UTF-8 $CATALOGUES_FILE_PATH -o $CATALOGUES_FILE_PATH_NEW

sed -i 's/ï/i/g' $CATALOGUES_FILE_PATH_NEW
```

- Import des données de `Catalogue.csv` dans la collection `catalogues`.

```bash
mongoimport --db sourceCSV --collection catalogue --type csv --file $CATALOGUES_FILE_PATH_NEW --headerline;
```

## III. Oracle NoSQL

## Description:

Scripts pour importer des données CSV dans KVStore.

1. **Démarrage d'Oracle NoSQL.**

```bash
nohup java -Xmx64m -Xms64m -jar $KVHOME/lib/kvstore.jar kvlite -secure-config disable -root $KVROOT &

java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host localhost
```

- Tester la connexion puis quitter la session.

```bash
kv-> connect store -name kvstore
kv-> exit
```

2. **Importer les fichiers CSV.**

- Les fichiers `Marketing.csv`, `Clients_4.csv` et `Clients_13.csv` sont dans `/vagrant/tpa_groupe_14/data`.

- Le programme JAVA : `ImportCSVtoNOSQL.java` est dans `/vagrant/tpa_groupe_14/1_data_lake/java`.

- Exécuter la commande ci-dessous :

```bash
export TPT_HOME=/vagrant/tpa_groupe_14/1_data_lake/java
```

- Compiler ImportCSVtoNOSQL.java.

```bash
javac -g -cp $KVHOME/lib/kvclient.jar:$TPT_HOME $TPT_HOME/ImportCSVtoNOSQL.java
```

- Définition du jeu de caractères des fichiers CSV en UTF-8.

```bash
MARKETING_FILE="$DS_PATH/Marketing.csv"
CLIENTS_4_FILE="$DS_PATH/Clients_4.csv"
CLIENTS_13_FILE="$DS_PATH/Clients_13.csv"

MARKETING_FILE_NEW="$DS_PATH/Marketing_UTF8.csv"
CLIENTS_4_FILE_NEW="$DS_PATH/Clients_4_UTF8.csv"
CLIENTS_13_FILE_NEW="$DS_PATH/Clients_13_UTF8.csv"

iconv -f ISO-8859-1 -t UTF-8 $MARKETING_FILE -o $MARKETING_FILE_NEW
iconv -f ISO-8859-1 -t UTF-8 $CLIENTS_4_FILE -o $CLIENTS_4_FILE_NEW
iconv -f ISO-8859-1 -t UTF-8 $CLIENTS_13_FILE -o $CLIENTS_13_FILE_NEW
```

- Importez les 3 fichiers CSV dans Oracle NoSQL.

- Marketing.csv, avec le type "marketing".

```bash
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$TPT_HOME ImportCSVtoNOSQL $MARKETING_FILE_NEW marketing
```

- Clients_4.csv, avec le type "client".

```bash
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$TPT_HOME ImportCSVtoNOSQL $CLIENTS_4_FILE_NEW client
```

- Clients_13.csv, avec le type "client".

```bash
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$TPT_HOME ImportCSVtoNOSQL $CLIENTS_13_FILE_NEW client
```

- Vérifiez que les tables sont bien créé

```bash
java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host localhost

kv-> connect store -name kvstore
kv-> execute "show tables"
```

# B. HIVE

## Description:

Un script pour créer un Data Lake dans `Hive`.

1. **Démarrage de Hive**

```bash
start-dfs.sh
start-yarn.sh

nohup hive --service metastore > /dev/null &
nohup hiveserver2 > /dev/null &
```

- Connexion à Hive

```bash
beeline -u jdbc:hive2://localhost:10000 "" ""
```

2. **Hive table**

- Créez les tables suivantes :

    - Table locale : `catalogue`
    - Table externe depuis Oracle NoSQL : `immatriculation_ext`,`clients_ext`, `marketing_ext`

- Exécutez les commandes dans `sql/hive-table-create-1.sql`.

- Vérifiez que les tables sont bien créées : `catalogue`, `client_ext`, `immatriculation_ext`, `marketing_ext`

```bash
0: jdbc:hive2://localhost:10000> show tables;
```

4. **Exécuter le processus ETL Python.**

- Ouvrez un nouveau terminal et exécutez vagrant ssh
- Allez dans le dossier de l' ETL

```bash
cd /vagrant/tpa_groupe_14/1_data_lake/python/
```

- Installez les requis de `dataLoader.py`

```bash
pip install pymongo==3.12.0
```

- Lancez le programme python

```bash
python3 dataLoader.py
```
