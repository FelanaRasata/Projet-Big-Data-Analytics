# Hadoop HDFS Part

## Description:

A script to upload files to Hadoop HDFS

## Requirements: Hadoop installed and configured

1. **Starting Hadoop HDFS**

```bash
$ start-dfs.sh
```

2. **Put CO2.csv in Hadoop HDFS**
   \*INSTRUCTION: Replace $DS_PATH with the actual file path
   Put the file "CO2.csv" in the following path: `/vagrant/tpt/data`

- Create a variable that contains the path of "CO2.csv"

```bash
$ DS_PATH="/vagrant/tpt/data/CO2.csv"
```

- Create folder to put the file in hadoop hdfs

```bash
$ hadoop fs -mkdir -p /tpt/data
```

- Put the file in Hadoop HDFS

```bash
$ hadoop fs -put -f $DS_PATH /tpt/data
```
