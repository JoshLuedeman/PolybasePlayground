SELECT SERVERPROPERTY ('IsPolybaseInstalled') as IsPolybaseinstalled

sp_configure @configname = 'hadoop connectivity', @configvalue = 7;
GO

RECONFIGURE 
GO

-- Create a master key on the database.  
-- Required to encrypt the credential secret.  
  
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Password1';  
  
-- Create a database scoped credential  for Kerberos-secured Hadoop clusters.  
-- IDENTITY: the Kerberos user name.  
-- SECRET: the Kerberos password  
  
CREATE DATABASE SCOPED CREDENTIAL hdpadmin  
WITH IDENTITY = 'hdpadmin', Secret = 'Password1';

-- Create an external data source.  
-- LOCATION (Required) : Hadoop Name Node IP address and port.  
-- RESOURCE MANAGER LOCATION (Optional): Hadoop Resource Manager location to enable pushdown computation.  
-- CREDENTIAL (Optional):  the database scoped credential, created above.  
 
  
CREATE EXTERNAL DATA SOURCE PolyPgHadoop WITH (  
        TYPE = HADOOP,   
        LOCATION ='hdfs://10.0.0.6:8020',   
        RESOURCE_MANAGER_LOCATION = '10.0.0.5:8050',   
        CREDENTIAL = [hdpadmin]     
);  

-- Create an external file format.  
-- FORMAT TYPE: Type of format in Hadoop (DELIMITEDTEXT,  RCFILE, ORC, PARQUET).  

CREATE EXTERNAL FILE FORMAT CSV WITH (  
        FORMAT_TYPE = DELIMITEDTEXT,   
        FORMAT_OPTIONS (FIELD_TERMINATOR =',',   
                USE_TYPE_DEFAULT = TRUE)) ;

  
