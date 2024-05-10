# Oracle NoSQL Part

# Description:

A script to import CSV data into Oracle NoSQL.

1. **Starting Oracle NoSql**

```bash
$ nohup java -Xmx64m -Xms64m -jar $KVHOME/lib/kvstore.jar kvlite -secure-config disable -root $KVROOT &

$ java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host localhost
```

- Connect to kvstore

```bash
kv-> connect store -name kvstore
```

2. **Import the CSV files**

- \*INSTRUCTION: Open a new CMD with vagrant ssh

- \*INSTRUCTION:

  - Put `Marketing.csv` ,`Clients_4.csv`, `Clients_13.csv` in `/vagrant/tpt/data`
  - Put `ImportCSVtoNOSQL.java` in `/vagrant/tpt/java`

- Run this commande :

```bash
$ export TPTHOME=/vagrant/tpt/java
```

- Compile ImportCSVtoNOSQL.java

```bash
$ javac -g -cp $KVHOME/lib/kvclient.jar:$TPTHOME $TPTHOME/ImportCSVtoNOSQL.java
```

- Import the 3 csv in oracle noSql

  - Marketing.csv, with the type "marketing"

```bash
$ java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$TPTHOME ImportCSVtoNOSQL /vagrant/tpt/data/Marketing.csv marketing
```

    * Clients_4.csv, with the type "client"

```bash
$ java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$TPTHOME ImportCSVtoNOSQL /vagrant/tpt/data/Clients_4.csv client
```

    * Clients_13.csv, with the type "client"

```bash
$ java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$TPTHOME ImportCSVtoNOSQL /vagrant/tpt/data/Clients_13.csv client
```
