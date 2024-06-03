# Chargement des données dans Oracle NoSQL

# Description:

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

- Mettre :

  - `Marketing.csv`, `Clients_4.csv` et `Clients_13.csv` dans `/vagrant/tpa_groupe_14/data`.
  - `ImportCSVtoNOSQL.java` dans `/vagrant/tpa_groupe_14/java`.

- Exécuter la commande ci-dessous :

```bash
export TPT_HOME=/vagrant/tpa_groupe_14/java
```

- Compiler ImportCSVtoNOSQL.java.

```bash
javac -g -cp $KVHOME/lib/kvclient.jar:$TPT_HOME $TPT_HOME/ImportCSVtoNOSQL.java
```

- Définition du jeu de caractères des fichiers CSV en UTF-8.

```bash
DS_PATH="/vagrant/tpa_groupe_14/data"

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
- 
```bash
java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host localhost

kv-> connect store -name kvstore
kv-> execute "show tables"
```

