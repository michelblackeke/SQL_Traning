-- How To Create A Database
Create Database NewHospital
;

-- How To Use a Database
Use NewHospital
;

--How To Create A Table (1)
Create Table [PRSN_TABLE](
[Prsn_ID] [int] NOT NULL,
[NAME] [Varchar](50) NULL,
[AGE] [int] NULL,
[MRN_NB] [int] NULL 
)

--How Load Data In A Table
Insert into PRSN_TABLE
(Prsn_ID,NAME,AGE,MRN_NB)
Values (1, 'Bob', '35', '111'),
       (2, 'john', '25', '222'),
	   (3, 'Mary', '21', '333'),
	   (4, 'Bill', '28', '444'),
	   (5, 'Jack', '15', (null)),
	   (6, 'Jake', '15', '666'),
	   (7, 'Anne', '25', '777')
--How to delete and rollback transaction 
Begin Tran---- 1
go -------
RollBack Tran---2
go
Begin Tran-----3 
Delete From PRSN_TABLE
Where  Prsn_ID = 5


RollBack Tran

select *
from  PRSN_TABLE


--HOw To Create A Table (2)
Create Table [PRSN_PHNTABLE](
[PRSN_ID] [int] NOT NULL,
[LNE_NB] [int] NULL,
[USG_TYP] [Varchar](50) NUll,
[PHONE_NBR] [int] NULL
)

--How To Load A Table
Insert into [PRSN_PHNTABLE]
(PRSN_ID,LNE_NB,PHONE_NBR)
Values  (1,'1','Home','915-111-2222'),
		(2,'1','Home','415-222-3333'),
		(2,'2','Work','510-333-4444'),
		(4,'1','Work','650-444-5555'),
		(4,'2','Null','925-333-4444'),
		(5,'1','Home','504-555-6666'),
		(5,'2','Null','510-555-6666')
--How To Create A Table (3)
Create Table [PRSN_ADDRTABLE](
[PRSN_ID] [int] NOT NULL,
[LNE_NB] [int] NULL,
[ADDR_TYP] [Varchar](50) NULL,
[ADDR] [Varchar](50) NULL
)


select * 
From [PRSN_ADDR TABLE]

select * 
From [PRSN_PHNTABLE]

select * 
From PRSN_TABLE



/** Write a query that returns all rows from PRSN table with its corresponding phone number and address, if address or phone number is not 
available, display N/A, display a comment depening on whether They have an address, a phone number or both**/

--HOW TO JOIN A MULITPLE TABLES 
SELECT *
FROM PRSN_TABLE
(
Select A.Prsn_ID,
A.NAME,
A.AGE,
A.MRN_NB,
B.LNE_NB,
B.ADDR_TYP,
B.ADDR,
C.LNE_NB,
C.USG_TYP,
C.PHONE_NBR,
CASE WHEN C.PHONE_NBR IS NULL THEN 'N/A' ELSE C.PHONE_NBR END AS PHONE_NUMBER,
CASE WHEN B.ADDR IS NULL THEN 'N/A' ELSE B.ADDR END AS ADDR,
CASE WHEN C.PHONE_NBR IS NOT NULL AND B.ADDR IS NOT NULL THEN 'MEMBER HAS BOTH'
WHEN B.ADDR IS NOT NULL AND C.PHONE_NBR IS NULL THEN 'MEMEBER HAS ADDRESS ONLY'
WHEN C.PHONE_NBR IS NOT NULL AND B.ADDR IS NULL THEN 'MEMEBER HAS PHONE NUMBER ONLY'
ELSE 'MEMBER HAS NONE'
END AS MEMBER_RECORD
FROM PRSN_TABLE AS A
LEFT JOIN
[PRSN_ADDR TABLE] AS B
ON A.Prsn_ID = B.PRSN_ID
LEFT JOIN PRSN_PHNTABLE AS C
ON C.PRSN_ID = A.Prsn_ID




/** WRITE A QUERY THAT RETURN THE ADDRESS AND PHONE NUMBER OF THE OLDEST PERSON FROM THE PRSN TABLE **/


--LEFT JOIN
Select * FROM
(
SELECT A.NAME,
A.AGE,
ROW_NUMBER() OVER(ORDER BY A.AGE DESC) AS ROLL_NUMBER,
RANK() OVER(ORDER BY A.AGE DESC) AS RANK_NUMBER,
DENSE_RANK() OVER(ORDER BY A.AGE DESC) AS DENSERANK_NUMBER,
B.ADDR_TYP,
B.ADDR,
C.PHONE_NBR
FROM PRSN_TABLE AS A
LEFT JOIN
[PRSN_ADDR TABLE] AS B
ON A.Prsn_ID = B.PRSN_ID
LEFT JOIN PRSN_PHNTABLE AS C
ON C.PRSN_ID = A.Prsn_ID
) AS TABLEBYRANK
WHERE DENSERANK_NUMBER IN (3, 4)



Select * FROM
(
SELECT A.NAME,
A.AGE,
ROW_NUMBER() OVER(ORDER BY A.AGE DESC) AS ROLL_NUMBER,
RANK() OVER(ORDER BY A.AGE DESC) AS RANK_NUMBER,
DENSE_RANK() OVER(ORDER BY A.AGE DESC) AS DENSERANK_NUMBER
FROM PRSN_TABLE AS A
LEFT JOIN
[PRSN_ADDR TABLE] AS B
ON A.Prsn_ID = B.PRSN_ID
LEFT JOIN PRSN_PHNTABLE AS C
ON C.PRSN_ID = A.Prsn_ID
) AS TABLEBYRANK
WHERE DENSERANK_NUMBER IN (3, 4)

Select *
From PRSN_TABLE

--How to Delete and rollback 
Begin Tran
Rollback Tran
;
Begin Tran
Delete From PRSN_TABLE
Where [NAME] = 'Jack'
Rollback Tran
Go



Commit Tran
Go



