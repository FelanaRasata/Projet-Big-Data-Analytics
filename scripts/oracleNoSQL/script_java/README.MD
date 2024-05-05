1- put Marketing.csv ,Clients_4.csv and ImportCSVtoNOSQL.java in datasource

2- execute : export MYTPHOME=/vagrant/datasource

3- compile : 
javac -g -cp $KVHOME/lib/kvclient.jar:$MYTPHOME $MYTPHOME ImportCSVtoNOSQL.java

3- execute : 
java -Xmx256m -Xms256m -cp $KVHOME/lib/kvclient.jar:$MYTPHOME ImportCSVtoNOSQL
