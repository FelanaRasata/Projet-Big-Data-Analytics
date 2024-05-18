# Partie : Oracle NoSQL

# Description:

Un script pour importer des données CSV dans Oracle NoSQL.

1. **Démarrage d'Oracle NoSQL.**

```bash
nohup java -Xmx64m -Xms64m -jar $KVHOME/lib/kvstore.jar kvlite -secure-config disable -root $KVROOT &

java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host localhost
```

- Connectez-vous à la base de données kvstore.

```bash
kv-> connect store -name kvstore
```

2. **Importer les fichiers CSV.**

- \*INSTRUCTION : Ouvrez une nouvelle fenêtre CMD avec "vagrant ssh".

- \*INSTRUCTION :

  - Mettez `Marketing.csv`, `Clients_4.csv` et `Clients_13.csv` dans `/vagrant/tpa_groupe_14/data`.
  - Mettez `ImportCSVtoNOSQL.java` dans `/vagrant/tpa_groupe_14/java`.

- Exécutez cette commande :

```bash
export TPTHOME=/vagrant/tpa_groupe_14/java
```

- Compilez ImportCSVtoNOSQL.java.

```bash
javac -g -cp $KVHOME/lib/kvclient.jar:$TPTHOME $TPTHOME/ImportCSVtoNOSQL.java
```

- Créez une variable contenant le chemin des fichiers CSV.

```bash
DS_PATH="/vagrant/tpa_groupe_14/data"

marketing_file="$DS_PATH/Marketing.csv"
clients_4_file="$DS_PATH/Clients_4.csv"
clients_13_file="$DS_PATH/Clients_13.csv"
```

- Définissez le jeu de caractères des fichiers CSV en UTF-8.

```bash
marketing_file_new="$DS_PATH/Marketing_UTF8.csv"
clients_4_file_new="$DS_PATH/Clients_4_UTF8.csv"
clients_13_file_new="$DS_PATH/Clients_13_UTF8.csv"

iconv -f ISO-8859-1 -t UTF-8 $marketing_file -o $marketing_file_new
iconv -f ISO-8859-1 -t UTF-8 $clients_4_file -o $clients_4_file_new
iconv -f ISO-8859-1 -t UTF-8 $clients_13_file -o $clients_13_file_new
```

- Importez les 3 fichiers CSV dans Oracle NoSQL.

- Marketing.csv, avec le type "marketing".

```bash
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$TPTHOME ImportCSVtoNOSQL $marketing_file_new marketing
```

- Clients_4.csv, avec le type "client".

```bash
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$TPTHOME ImportCSVtoNOSQL $clients_4_file_new client
```

- Clients_13.csv, avec le type "client".

```bash
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$TPTHOME ImportCSVtoNOSQL $clients_13_file_new client
```
