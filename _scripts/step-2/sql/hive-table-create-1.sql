-- HDFS
-- Immatriculation
CREATE TABLE IF NOT EXISTS immatriculation_hive_ext (
    objectid string,
    immatriculation string,
    marque string,
    nom string,
    puissance int,
    longueur string,
    nbplaces int,
    nbportes int,
    couleur string,
    occasion string,
    prix int
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
 STORED AS TEXTFILE LOCATION 'hdfs:/tpa_groupe_14/data/Immatriculations_UTF8.csv';

-- MongoDb
-- Catalogue
CREATE TABLE IF NOT EXISTS catalogue_hive ( 
    id string,
    marque string,
    nom string,
    puissance int,
    longueur string,
    nbplaces int,
    nbportes int,
    couleur string,
    occasion boolean,
    prix int
)
COMMENT 'Catalogue details' 
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;

-- Oracle NoSql
-- Client
CREATE EXTERNAL TABLE clients_hive_ext (
    id int,
    age int,
    sexe string,
    taux int,
    situationfamiliale string,
    nbenfantsacharge int,
    deuxiemevoiture boolean,
    immatriculation string
)
STORED BY 'oracle.kv.hadoop.hive.table.TableStorageHandler' 
TBLPROPERTIES (
"oracle.kv.kvstore" = "kvstore", 
"oracle.kv.hosts" =  "localhost:5000", 
"oracle.kv.hadoop.hosts" = "localhost/127.0.0.1", 
"oracle.kv.tableName" = "clients");

-- Marketing
CREATE EXTERNAL TABLE marketing_hive_ext (
    id int,
    age int,
    sexe string,
    taux int,
    situationfamiliale string,
    nbenfantsacharge int,
    deuxiemevoiture boolean
)
STORED BY 'oracle.kv.hadoop.hive.table.TableStorageHandler' 
TBLPROPERTIES (
"oracle.kv.kvstore" = "kvstore", 
"oracle.kv.hosts" =  "localhost:5000", 
"oracle.kv.hadoop.hosts" = "localhost/127.0.0.1", 
"oracle.kv.tableName" = "marketing");

