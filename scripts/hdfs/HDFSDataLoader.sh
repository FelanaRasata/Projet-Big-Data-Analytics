#!/bin/bash

# Script Name: hadoop-upload.sh
# Description: A script to upload files to Hadoop HDFS
# Requirements: Hadoop installed and configured

# *INSTRUCTION: Replace $DS_PATH with the actual file path
DS_PATH="/path/to/CO2.csv"

# Upload file to Hadoop HDFS
echo "Uploading file to Hadoop HDFS..."

hadoop fs -put -f $DS_PATH /user/your_username/sourceCSV

echo "File uploaded successfully."
