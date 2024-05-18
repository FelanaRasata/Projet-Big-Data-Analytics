# Suppression des données existantes

> _Note: veuillez lire attentivement_

Lancer ces commandes pour avoir accès aux différents CLIs

```bash
start-dfs.sh
start-yarn.sh

nohup hive --service metastore > /dev/null &
nohup hiveserver2 > /dev/null &
nohup java -Xmx64m -Xms64m -jar $KVHOME/lib/kvstore.jar kvlite -secure-config disable -root $KVROOT &
```

---

- Supprimer CO2.csv de HDFS

```bash
hadoop fs -rm -r /tpa_groupe_14/data
```

- Supprimer immatriculations et catalogues de MongoDB

```bash
# Accès à mongoshell
mongo

> use sourceCSV
> db.catalogues.drop()
```

- Supprimer les tables de NoSQL

```bash
# Connexion à KVStore
java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host localhost

kv-> connect store -name kvstore
kv-> execute'drop table marketing'
kv-> execute'drop table clients'
```

- Supprimer les tables internes ou externes de Hive

```bash
beeline -u jdbc:hive2://localhost:10000 "" ""

0: jdbc:hive2://localhost:10000> drop table if exists catalogue;
0: jdbc:hive2://localhost:10000> drop table if exists catalogue_co2_ext;
0: jdbc:hive2://localhost:10000> drop table if exists clients_ext;
0: jdbc:hive2://localhost:10000> drop table if exists immatriculation_ext;
0: jdbc:hive2://localhost:10000> drop table if exists marketing_ext;
```
