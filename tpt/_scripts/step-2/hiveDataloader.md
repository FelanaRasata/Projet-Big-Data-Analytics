# STEP 2 : HIVE SQL

## Description:

A script to create datalake in `Hive`.

1. **Starting Hive**

```bash
$ start-dfs.sh

$ start-yarn.sh

$ nohup hive --service metastore > /dev/null &
$ nohup hiveserver2 > /dev/null &

$ beeline
```

- Connection

```bash
beeline> !connect jdbc:hive2://localhost:10000
```

\*Don't enter username and password, double click enter.

2. **Drop table**

- Run `1-hive-table-drop.sql` if these tables exist.

3. **Hive table 1**

- Create table

  - Table : `immatriculisation_hive` ,`catalogue_hive`
  - External table from Oracle NoSQL : `clients_hive_ext`, `marketing_hive_ext`

- Run `2-hive-table-create-1.sql`.

4. **Run Python ETL**

- Open a new terminal and execute vagrant ssh

- Go to the ETL folder

```bash
$ cd /vagrant/tpt/python/
```

- Install needed requirements  for `dataLoader.py`

```bash
$ pip install pymongo==3.12.0
```

- Run the python program

```bash
$ python3 dataLoader.py
```

=======================================================

5. **MapReduce**

- Open jupyter

```bash
$ jupyter lab --ip=0.0.0.0
```

- Upload the file `mapreduce.ipynb` in `/vagrant/tpt/python/` in jupyter

- Run `mapreduce.ipynb`

6. **Hive table 2**

- Create table

  - External table from HDFS : `co2_hive_ext`

- Run `3-hive-table-create-2.sql`.
