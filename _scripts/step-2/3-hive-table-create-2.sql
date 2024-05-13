-- HDFS CO2
CREATE EXTERNAL TABLE catalogue_co2_hive_ext (
    id string,
    nom string,
    puissance int,
    longueur string,
    nbplaces int,
    nbportes int,
    couleur string,
    occasion boolean,
    prix int,
    marque string, 
    bonusmalus string, 
    rejetco2 int, 
    coutenergie string
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
 STORED AS TEXTFILE LOCATION 'hdfs:/tpt/mapreduce';