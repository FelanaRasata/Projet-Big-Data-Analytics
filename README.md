# Analyse de la Clientèle d'un Concessionnaire Automobile pour la Recommandation de Modèles de Véhicules

## Notice : Lire attentivement

Ce guide vous aidera à initialiser les différents composants nécessaires pour l'analyse des données de clientèle et la recommandation de modèles de véhicules. Veuillez suivre les étapes ci-dessous pour configurer et lancer les différents outils et services utilisés dans ce projet.

---

### 1. Initialiser le Système de Fichiers Distribué Hadoop (HDFS)

Le système HDFS est utilisé pour stocker les données massives nécessaires à notre analyse. Pour démarrer HDFS et YARN (Yet Another Resource Negotiator), exécutez les commandes suivantes :

```bash
start-dfs.sh
start-yarn.sh
```

Ces commandes démarrent le système de fichiers distribué et le gestionnaire de ressources de Hadoop.

### 2. Démarrer les Services Hive

Hive est utilisé pour gérer et interroger notre lac de données. Pour démarrer les services Hive, exécutez les commandes suivantes :

```bash
nohup hive --service metastore > /dev/null &
nohup hiveserver2 > /dev/null &
```

- `nohup hive --service metastore > /dev/null &` : Démarre le service Metastore de Hive en arrière-plan.
- `nohup hiveserver2 > /dev/null &` : Démarre le serveur HiveServer2 en arrière-plan, permettant l'interaction avec les clients Hive.

### 3. Lancer le KVStore

KVStore est utilisé pour le stockage de clé-valeur rapide et sécurisé. Pour démarrer le service KVStore, exécutez la commande suivante :

```bash
nohup java -Xmx64m -Xms64m -jar $KVHOME/lib/kvstore.jar kvlite -secure-config disable -root $KVROOT &
```

Cette commande démarre le service KVStore avec une configuration de sécurité désactivée et définit le répertoire racine du KVStore.

### Optionnel : Tester la Connexion au KVStore

Pour tester la connexion au KVStore et vérifier que tout fonctionne correctement, utilisez les commandes suivantes :

```bash
java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host localhost
```

Puis, dans l'interface de commande du KVStore :

```bash
kv-> connect store -name kvstore
kv-> exit
```

- `connect store -name kvstore` : Connecte le client au magasin de données nommé `kvstore`.
- `exit` : Quitte l'interface de commande du KVStore.

---

### Structure du Projet

1. **Données** : Les fichiers de données nécessaires pour l'analyse (immatriculations, catalogue, clients, marketing).
2. **Scripts** : Les scripts pour le chargement, le traitement et l'analyse des données.
3. **Documents** : Documentation du projet, y compris ce fichier `readme.md` et le document de projet principal.

---

### Remarques Supplémentaires

- Assurez-vous que tous les services démarrés continuent de fonctionner en arrière-plan avant de lancer les analyses.
- Les résultats des analyses seront stockés dans la base de résultats spécifiée dans le projet.

---

### Contacts

Pour toute question ou assistance, veuillez contacter les responsables du projet.
