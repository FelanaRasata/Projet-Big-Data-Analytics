# Oracle NoSQL Part

# Description:

A script to import CSV data into Oracle NoSQL.

1. **Starting Oracle NoSql**

```bash
nohup java -Xmx64m -Xms64m -jar $KVHOME/lib/kvstore.jar kvlite -secure-config disable -root $KVROOT &

java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host localhost
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
export TPTHOME=/vagrant/tpt/java
```

- Compile ImportCSVtoNOSQL.java

```bash
javac -g -cp $KVHOME/lib/kvclient.jar:$TPTHOME $TPTHOME/ImportCSVtoNOSQL.java
```
```bash
DS_PATH="/vagrant/tpa_groupe_14/data"

marketing_file="$DS_PATH/Marketing.csv"
clients_4_file="$DS_PATH/Clients_4.csv"
clients_13_file="$DS_PATH/Clients_13.csv"




marketing_file_new="$DS_PATH/Marketing_UTF8.csv"
clients_4_file_new="$DS_PATH/Clients_4_UTF8.csv"
clients_13_file_new="$DS_PATH/Clients_13_UTF8.csv"



iconv -f ISO-8859-1 -t UTF-8 $marketing_file -o $marketing_file_new

iconv -f ISO-8859-1 -t UTF-8 $clients_4_file -o $clients_4_file_new
iconv -f ISO-8859-1 -t UTF-8 $clients_13_file -o $clients_13_file_new

```
- Import the 3 csv in oracle noSql

  - Marketing.csv, with the type "marketing"


```bash
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$TPTHOME ImportCSVtoNOSQL $marketing_file_new marketing
```

    * Clients_4.csv, with the type "client"

```bash
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$TPTHOME ImportCSVtoNOSQL $clients_4_file_new client
```

    * Clients_13.csv, with the type "client"

```bash
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$TPTHOME ImportCSVtoNOSQL $clients_13_file_new client
```
