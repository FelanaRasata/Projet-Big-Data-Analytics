
start-dfs.sh

start-yarn.sh

nohup hive --service metastore > /dev/null &
nohup hiveserver2 > /dev/null &

beeline

beeline>   !connect jdbc:hive2://localhost:10000

Enter username for jdbc:hive2://localhost:10000: oracle
Enter password for jdbc:hive2://localhost:10000: ********
(password : welcome1)