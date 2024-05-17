- Supprimer CO2.csv de HDFS

```bash
hadoop fs -rm -r /tpa_groupe_14/data
```

- Supprimer immatriculations et catalogues de MongoDB

```bash
mongo

> use sourceCSV
> db.immatriculations.drop()
> db.catalogues.drop()
```

- Supprimer les tables de NoSQL

```bash
nohup java -Xmx64m -Xms64m -jar $KVHOME/lib/kvstore.jar kvlite -secure-config disable -root $KVROOT &

java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host localhost

kv-> connect store -name kvstore
kv-> execute'drop table marketing'
kv-> execute'drop table clients'
```

- Supprimer les tables internes ou externes de Hive

```bash
drop table catalogue_hive;
drop table catalogue_co2_hive_ext;
drop table clients_hive_ext;
drop table immatriculation_hive;
drop table marketing_hive_ext;
```
