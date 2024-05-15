# ETAPE 2 : HIVE

## Description:

Un script pour créer un Data Lake dans `Hive`.

1. **Démarrage de Hive**

```bash
start-dfs.sh

start-yarn.sh

nohup hive --service metastore > /dev/null &
nohup hiveserver2 > /dev/null &

beeline
```

- Connexion à Hive

```bash
beeline> !connect jdbc:hive2://localhost:10000
```

\*Ne saisissez pas de nom d'utilisateur ni de mot de passe, appuyez simplement deux fois sur Entrée.

2. **Hive table 1**

- Créez les tables suivantes :

  - Table locale : `immatriculation_hive`, `catalogue_hive`
  - Table externe depuis Oracle NoSQL : `clients_hive_ext`, `marketing_hive_ext`

- Exécutez le code dans `hive-table-create-1.sql`.

4. **Exécuter le processus ETL Python.**

- Open a new terminal and execute vagrant ssh

- Go to the ETL folder

```bash
cd /vagrant/tpa_groupe_14/python/
```

- Install needed requirements for `dataLoader.py`

```bash
pip install pymongo==3.12.0
```

- Run the python program

```bash
python3 dataLoader.py
```

5. **MapReduce**

- Open jupyter

```bash
jupyter lab --ip=0.0.0.0
```

- Upload the file `mapreduce.ipynb` in `/vagrant/tpa_groupe_14/python/` in jupyter

- Run `mapreduce.ipynb`

6. **Hive table 2**

- Create table

  - External table from HDFS : `co2_hive_ext`

- Run `3-hive-table-create-2.sql`.
