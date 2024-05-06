sudo su oracle	

sqlplus sys as sysdba

alter user sys identified by OracleWelcome1;
alter user system identified by OracleWelcome1;

connect system@ORCLPDB1/OracleWelcome1


create user usertpt identified by welcome1;
grant dba to usertpt;
revoke unlimited tablespace from usertpt;
alter user usertpt quota unlimited on users;


connect usertpt@ORCLPDB1/welcome1

create or replace directory ORACLE_BIGDATA_CONFIG as '/vagrant/bigdatasql_config';
create or replace directory "ORA_BIGDATA_CL_bigdatalite" as '';

-- GRANT READ,WRITE ON DIRECTORY ORACLE_BIGDATA_CONFIG TO public;
-- GRANT READ,WRITE ON DIRECTORY "ORA_BIGDATA_CL_bigdatalite" TO public;

set pagesize 100
set linesize 200
col DIRECTORY_NAME format a30
col DIRECTORY_PATH format a70
select DIRECTORY_NAME, DIRECTORY_PATH from dba_directories;