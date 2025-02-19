--HOW TO CRAETE A DATABASE ?
CREATE DATABASE SAMCLASS 

USE SAMCLASS;

--HOW TO CREATE A TABLE ( A TABLE CONSIST OF COCLUM AND ROWS )
CREATE TABLE SAMCLASSTABLE (               --AFTER USING THE KEYWORD 'CREATE TABLE' PROVIDE TABLE NAME AND OPEN A BRACKET 
              SAMID int not null,
			  NAMES varchar(50) Null,
			  GENDER varchar(10) null,
			  SSN bigint not null
			                 )             -- After providing the column values we close the bracket 
	select *
	from SAMCLASSTABLE

	DROP TABLE SAMCLASSTABLE -- this is used to remove a table from a database 

--HOW TO LOAD DATA INTO A TABLE 
INSERT INTO SAMCLASSTABLE     -- HERE WE USE KEYWORDS (INSERT INTO TABLE NAME) TO LOAD VALUES INTO A TABLE STEP 1
          (SAMID,NAMES,GENDER,SSN) --- WE REPRESENTED OUR COLUMN NAME INSIDE A BRACKET step 2
VALUES (1,'SAM','MALE',111111111111),
       (2,'SOLA', 'FEMALE',222222222222),
	   (3,'MICHAE','MALE',33333333333333)

/**WE HAVE 5 COMMAND LANGUAGE CATEGORY IN SQL, WHICH ARE 
             ( DDL/      DML  /     DCL  /    TCL      /   DQL)
			  CREATE /  INSERT  /   GRANT/    COMMENT  /  SELECT
			  DROP   /  UPDATE   /  REVOICE/  ROLL BACK  /
			  ALTER   /  DELETE  /            SAVEPOINT  /
			  TRUNCATE  /  MERGE  /
**/

SELECT * 
FROM SAMCLASSTABLE
WHERE NAMES = 'SOLA'                       --WHERE CALUSE IS USED TO FILTER RECORDS 

SELECT *
FROM SAMCLASSTABLE
WHERE GENDER = 'MALE'

SELECT COUNT(*) AS TABLECOUNT 
FROM SAMCLASSTABLE

SELECT COUNT(GENDER) AS COUNTTABLE
FROM SAMCLASSTABLE
GROUP BY NAMES

ALTER TABLE SAMCLASSTABLE
ADD EMAIL varchar (100);

UPDATE SAMCLASSTABLE
SET EMAIL = 'MIKE'
WHERE EMAIL IS NULL 


ALTER TABLE SAMCLASSTABLE
ADD ADDRESS VARCHAR (200);

SELECT * FROM SAMCLASSTABLE


Create Proc spSamClassGenderByIdRecords
@GENDER varchar (30),
@SAMID int
As
Begin
    Select SAMID,NAMES,GENDER FROM SAMCLASSTABLE where GENDER =@GENDER and SAMID = @SAMID
END ;

 SpSamClassRecord


 spSamClassGenderByIdRecords 'FEMALE',2