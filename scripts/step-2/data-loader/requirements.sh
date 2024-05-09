start-dfs.sh
start-yarn.sh

nohup hive --service metastore > /dev/null &
nohup hiveserver2 > /dev/null &

# Install requirements
pip install pymongo==3.12.0
pip install thrift
pip install thrift-sasl
pip install PyHive
