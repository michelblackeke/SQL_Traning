CREATE DATABASE INTERVIEW


--HOW TO USE UNION AND UION ALL, IT IS USED FOR GAP ANALYSIS AND COMBAIN ALL THE TABLE TOO
Create Table TableA
(ID int not null)

Insert into TableA
Values (1),(2),(3),(4)

Create Table TableB
(ID int not null)

Insert into TableB
Values (3),(4),(5),(6)

--UNION REMOVES DUPLICATE BETWEEN TWO TABLE AND USED FOR GAP ANALYIZING
SELECT  'UNION' AS TSOURCE, ID
from TableA

UNION

SELECT  'UNION' AS TSOURCE, ID
from TableB

--NOTE UNION ALL BRINGS ALL THE FIED IN BOTH TABLE AND DOES NOT REMOVE DUPLICATE IT EQUALY COMBIN BOTH TABLE AND USED FOR GAP ANALYSIS
SELECT  'UNIONALL' AS TSOURCE, ID
from TableA

UNION ALL

SELECT  'UNIONALL' AS TSOURCE, ID
from TableB

SELECT A.ID AS 'TABLEA',
B.ID AS 'TABLEB'
FROM TableA AS A
full JOIN TableB AS B
ON A.ID = B.ID

/**How to create a temporary table , There Two TYPE OF TEMPORARY TABLE
one is Global and one is Local**/
Create  Table PET(
             PetID int not null,
			 PetName Varchar(50) null,
			 PetPhone int null
			 )
Insert into Pet
            (PetID,PetName,PetPhone)
Values      (1,'Bingo',1111111),
            (2,'Jack', 2222222),
			(3,'Peggy',3333333),
			(4,'Rocky',4444444),
			(5,'Chico',5555555)

Delete from pet
where PetID in (3 ,5)


Select *
from PET

Create  Table PETBackup(
             PetID int not null,
			 PetName Varchar(50) null,
			 PetPhone int null
			 )
Insert into PetBackup
            (PetID,PetName,PetPhone)
Values      (1,'Bingo',1111111),
            (2,'Jack', 2222222),
			(3,'Peggy',3333333),
			(4,'Rocky',4444444),
			(5,'Chico',5555555)

--Compare record between two Tables to indenitfly dlected record ---Gap analysis or data Compaire or deta Recociliation 
select *
from PETBackup
where PetID not in (Select  PetID from Pet)

-- compare record with NOT EXISTS AND EXISTS
select *
from PETBackup
where  not exists  (Select  PetID from PET)


--Creating Temp Table LOCAL TEMP TABLE
Select* into #PetUAT
From PETBackup

--Creating Temp Table GLOBAL TEMP TABLE
Select* into ##PetUAT
From PETBackup

Select*
From #PetUAT


--Creating Temp Table LOCAL TEMP TABLE--- another to craete a table using an esisting table strutue 
Select* into #PetUATNoRecord
From PETBackup
Where 1 = 0

select *
from #PetUATNoRecord

select *
From #PetUAT
where  PetID NOT IN (Select  PetID from PET)

Select*
From #PetUAT


--CRAETEING TEMP TABLE
Create  Table #PET(
             PetID int not null,
			 PetName Varchar(50) null,
			 PetPhone int null
			 )
Insert into #Pet
            (PetID,PetName,PetPhone)
Values      (1,'Bingo',1111111),
            (2,'Jack', 2222222),
			(3,'Peggy',3333333),
			(4,'Rocky',4444444),
			(5,'Chico',5555555)

			SELECT *
			from #PET
			
			SELECT *
			from PET

--CTE COMMON TABLE EXPRESSION 
With CTE  As (
SELECT * 
FROM PETBackup
where PetID =5
)
Select * 
From CTE


--CTE COMMON TABLE EXPRESSION and joining them with another table
With T1  As (
SELECT * 
FROM PETBackup
), 
T2 AS (
SELECT *
FROM Pet
)
Select * 
From T2,T1
WHERE T1.PetID =T2.PetID

-- Creating The CTE USING GAP ANALYTISIS Not in 
With T1  As (
SELECT * 
FROM PETBackup
), 
T2 AS (
SELECT *
FROM Pet
),
T3 As (
Select * 
From T1
WHERE T1.PetID not in (select PetID from T2)
), AS T4
(
SELECT * 
FROM T1
UPDATE T4 
SET PetName='ZICO'
WHERE PetName= 'Chico'
)
),T4 AS

select *
from PETBackup
where PetID not in (Select  PetID from Pet)

