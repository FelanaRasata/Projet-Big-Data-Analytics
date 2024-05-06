# Starting Oracle NoSql
nohup java -Xmx64m -Xms64m -jar $KVHOME/lib/kvstore.jar kvlite -secure-config disable -root $KVROOT &

# Starting Oracle NoSql
java -jar $KVHOME/lib/kvstore.jar runadmin -port 5000 -host localhost

kv -> connect store -name kvstore

# =====================================================================================================

# *INSTRUCTION: Open a new CMD with vagrant ssh

# *INSTRUCTION: 
# Put Marketing.csv ,Clients_4.csv, Clients_13.csv in "/vagrant/tpt/data"
# ImportCSVtoNOSQL.java in "/vagrant/tpt/java"

# Run this commande :
export TPTHOME=/vagrant/tpt/java

# Compile ImportCSVtoNOSQL.java
javac -g -cp $KVHOME/lib/kvclient.jar:$TPTHOME $TPTHOME/ImportCSVtoNOSQL.java

# Import the 3 csv in oracle noSql

# Marketing.csv, with the type "marketing"
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$MYTPHOME ImportCSVtoNOSQL /vagrant/tpt/data/Marketing.csv marketing

# Clients_4.csv, with the type "client"
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$MYTPHOME ImportCSVtoNOSQL /vagrant/tpt/data/Clients_4.csv client

# Clients_13.csv, with the type "client"
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$MYTPHOME ImportCSVtoNOSQL /vagrant/tpt/data/Clients_13.csv client

