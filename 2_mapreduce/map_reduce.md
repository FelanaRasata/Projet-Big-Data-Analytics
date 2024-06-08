# Etape 1 : MapReduce

## Description:

Un script pour réaliser le programme mapreduce

1. **Démarrage de Hive et HDFS**

```bash
start-dfs.sh
start-yarn.sh

nohup hive --service metastore > /dev/null &
nohup hiveserver2 > /dev/null &
```

2. **MapReduce Spark**

- Aller dans le dossier du fichier mapreduce `mapreduce.ipynb`

```bash
cd /vagrant/tpa_groupe_14/2_mapreduce/python/
```

- Lancez Jupyter dans le dossier du fichier mapreduce

```bash
jupyter lab --ip=0.0.0.0
```

- Accédez à Jupiter dans votre navigateur

- Exécutez chaque ligne de `mapreduce.ipynb`.

3. **Hive table**

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
