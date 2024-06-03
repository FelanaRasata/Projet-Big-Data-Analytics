# ETAPE 2 : HIVE

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

2. **Hive table - partie 1**

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
cd /vagrant/tpa_groupe_14/python/
```

- Installez les requis de `dataLoader.py`

```bash
pip install pymongo==3.12.0
```

- Lancez le programme python

```bash
python3 dataLoader.py
```

5. **MapReduce Spark**

- Aller dans le dossier du fichier mapreduce `mapreduce.ipynb`

```bash
cd /vagrant/tpa_groupe_14/python/
```

- Lancez Jupyter dans le dossier du fichier mapreduce

```bash
jupyter lab --ip=0.0.0.0
```

- Accédez à Jupiter dans votre navigateur

- Exécutez chaque ligne de `mapreduce.ipynb`.

6. **Hive table - partie 2**

- Ouvrez un nouveau terminal et exécutez vagrant ssh
- Connexion à Hive

```bash
beeline -u jdbc:hive2://localhost:10000 "" ""
```

- Créez la table `catalogue_co2_ext`, une table externe depuis HDFS, résultat du processus MapReduce.

- Exécutez le code dans `sql/hive-table-create-2.sql`.

- Vérifiez que les tables sont bien créées : `catalogue`, `client_ext`, `immatriculation_ext`, `marketing_ext` et `catalogue_co2_ext`

```bash
0: jdbc:hive2://localhost:10000> show tables;
```
