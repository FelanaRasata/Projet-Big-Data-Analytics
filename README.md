# Projet-Big-Data-Analytics - Groupe TPA 14

## Data Processing Workflow Explanation

## Overview

This document outlines the workflow for processing data using a combination of MongoDB, Hadoop HDFS, and HiveSQL. The process involves importing data from CSV files into MongoDB, uploading files to Hadoop HDFS, and then bulk inserting data from MongoDB into HiveSQL tables.

### Steps

**Prerequisites**

Put the folder `tpt` in the root folder of your MV

1. **Importing CSV Data into MongoDB**

The first step involves importing CSV data into MongoDB collections using the `mongo-import.js` script. This script is executed within the MongoDB shell and performs the following tasks:

- Imports data from two CSV files (`Immatriculations.csv` and `Catalogue.csv`) into the `sourceCSV` database.
- The `immatriculations` collection stores data from the `Immatriculations.csv` file.
- The `catalogues` collection stores data from the `Catalogue.csv` file.

2. **Uploading Files to Hadoop HDFS**

The second step involves uploading files to Hadoop HDFS using the `hadoop-upload.sh` script. This script uploads a CSV file (`CO2.csv`) to the Hadoop HDFS under the `/user/your_username/sourceCSV` directory. The script performs the following tasks:

- Uploads the `CO2.csv` file to the specified directory in Hadoop HDFS.
- Ensures that Hadoop is installed and configured properly on the system.

3. **Bulk Inserting Data from MongoDB into HiveSQL**

The final step involves bulk inserting data from MongoDB into HiveSQL tables using the `main.py` script. This Python script connects to both MongoDB and HiveSQL to perform the following tasks:

- Fetches data from the `sourceCSV` database in MongoDB.
- Inserts the fetched data into corresponding tables in HiveSQL, with each collection in MongoDB representing a table in HiveSQL.
- The script is optimized to handle large datasets efficiently, with the `batch_insert_data` function batching insert operations to improve performance.

## Conclusion

By following this workflow, you can effectively process and analyze data stored in CSV files using MongoDB, Hadoop HDFS, and HiveSQL. Each step in the process is automated through scripts, simplifying the data processing pipeline and ensuring efficient data management and analysis.
