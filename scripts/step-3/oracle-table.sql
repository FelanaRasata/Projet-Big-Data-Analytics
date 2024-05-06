-- Oracle CO2

CREATE  TABLE co2_hive_ext (
    id int, 
    marquemodele varchar(100), 
    bonus int, 
    rejetco2 int, 
    coutenergie int
)
 ORGANIZATION EXTERNAL (
 TYPE ORACLE_HIVE
 DEFAULT DIRECTORY ORACLE_BIGDATA_CONFIG
 ACCESS PARAMETERS (
 com.oracle.bigdata.tablename=default.co2_hive_ext
 )
) 
REJECT LIMIT UNLIMITED;

CREATE TABLE  co2_hive_ext(
    id int, 
    marquemodele varchar(100), 
    bonus int, 
    rejetco2 int, 
    coutenergie int
)
ORGANIZATION EXTERNAL (
TYPE ORACLE_HIVE 
DEFAULT DIRECTORY   ORACLE_BIGDATA_CONFIG
ACCESS PARAMETERS 
(
    com.oracle.bigdata.tablename=default.co2_hive_ext
)
) 
REJECT LIMIT UNLIMITED;

-- Oracle Immatriculisation
CREATE  TABLE immatriculisation_hive (
    immatriculation varchar(100),
    marque varchar(100),
    nom varchar(100),
    puissance int,
    longueur varchar(100),
    nbPlaces int,
    nbPortes int,
    couleur varchar(100),
    occasion boolean,
    prix int
)
 ORGANIZATION EXTERNAL (
 TYPE ORACLE_HIVE
 DEFAULT DIRECTORY ORACLE_BIGDATA_CONFIG
 ACCESS PARAMETERS (
 com.oracle.bigdata.tablename=default.immatriculisation_hive
 )
) 
REJECT LIMIT UNLIMITED;

-- Oracle Catalogue
CREATE  TABLE catalogue_hive (
    immatriculation varchar(100),
    marque varchar(100),
    nom varchar(100),
    puissance int,
    longueur varchar(100),
    nbPlaces int,
    nbPortes int,
    couleur varchar(100),
    occasion boolean,
    prix int
)
 ORGANIZATION EXTERNAL (
 TYPE ORACLE_HIVE
 DEFAULT DIRECTORY ORACLE_BIGDATA_CONFIG
 ACCESS PARAMETERS (
 com.oracle.bigdata.tablename=default.catalogue_hive
 )
) 
REJECT LIMIT UNLIMITED;

-- Oracle Marketing
CREATE  TABLE marketing_hive_ext (
    id int,
    age int,
    sexe char(1),
    taux int,
    situationfamiliale varchar(100),
    nbenfantsacharge int,
    deuxiemevoiture NUMBER(1)
)
 ORGANIZATION EXTERNAL (
 TYPE ORACLE_HIVE
 DEFAULT DIRECTORY ORACLE_BIGDATA_CONFIG
 ACCESS PARAMETERS (
 com.oracle.bigdata.tablename=default.marketing_hive_ext
 )
) 
REJECT LIMIT UNLIMITED;

-- Oracle Clients
CREATE  TABLE clients_hive_ext (
    id int,
    age int,
    sexe char(1),
    taux int,
    situationfamiliale varchar(100),
    nbenfantsacharge int,
    deuxiemevoiture boolean,
    immatriculation varchar(100)
)
 ORGANIZATION EXTERNAL (
 TYPE ORACLE_HIVE
 DEFAULT DIRECTORY ORACLE_BIGDATA_CONFIG
 ACCESS PARAMETERS (
 com.oracle.bigdata.tablename=default.clients_hive_ext
 )
) 
REJECT LIMIT UNLIMITED;