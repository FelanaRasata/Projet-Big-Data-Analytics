# ETAPE 3 : ANALYSE DES DONNEES

## Description:

Un script pour l'analyse du Data Lake dans `Hive`.

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

2. **Démarrage de Hive**

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

4. **Exécuter le processus d'Analyse de donnée.**

- Ouvrir un nouveau terminal et lancer vagrant ssh
- Aller dans le dossier du script `sujet_analyse.ipynb`

```bash
cd /vagrant/tpa_groupe_14/python/
```

- Installer tous les requis du script

```bash
pip install pyhive
pip install thrift
pip install thrift_sasl
pip install pandas
pip install seaborn
pip install scikit-learn
```

- Lancez Jupyter dans le dossier du fichier mapreduce

```bash
jupyter lab --ip=0.0.0.0
```

- Accédez à Jupiter dans votre navigateur

- Exécutez chaque ligne de `sujet_analyse.ipynb`.
