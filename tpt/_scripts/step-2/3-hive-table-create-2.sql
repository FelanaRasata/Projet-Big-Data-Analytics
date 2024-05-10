-- HDFS CO2
CREATE EXTERNAL TABLE co2_hive_ext (
    marque string, 
    bonusmalus string, 
    rejetco2 int, 
    coutenergie string
)
 ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
 STORED AS TEXTFILE LOCATION 'hdfs:/tpt/mapreduce';