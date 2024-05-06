# Description: A script to upload files to Hadoop HDFS
# Requirements: Hadoop installed and configured

# Démarrage de Hadoop HDFS
start-dfs.sh

# *INSTRUCTION: Replace $DS_PATH with the actual file path
# Put the file "CO2.csv" in the following path
DS_PATH="/vagrant/tpt/data/CO2.csv"


# Create folder to put the file
hadoop fs -mkdir -p /tpt/data

hadoop fs -put -f $DS_PATH /tpt/data

echo "File uploaded successfully."
