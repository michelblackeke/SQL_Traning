/**Insert Into Insurance Claims (RecKey, PolicyID, PolicyNumber, PolicyType, E Values 
(1, 2, "Pol002', 'Hospital Cover', '01-October -07* , 
1, 'DOCA', 0), (2, 2, 'Pol002" , 'Hospital Cover' , '01-October-07', 4, 'Doc* • 0) : (3, 2, "Polee2" , 'Hospital Cover' , '01-October-07' , 
5, 'DocC" (4, 2, *Polee2" 'Hospital Cover' '01-October-07' , 1), , 7, 'DOCD" (5, 2, 'Pol002" , 'Hospital Cover' 81-october 07, 20, Doct, 1);
**/

--How To Create A Database
Create Database Insurance
;
--How To Use A Database
Use Insurance
;
--How To Create A Table
Create Table [Insurance_Claims](
             [RecKey]int Not Null,
			 [PolicyID]int Not Null,
			 [PolicyNumber]Varchar(50) Null,
			 [PolicyType] Varchar(50) Null,
			 [EffectiveDate] date Null,
			 [DocumentName] Varchar (50) Null,
			 [Submitted] int Not Null
			                   )  
	select *
	from Insurance_Claims
	Drop Table Insurance_Claims
--How To Insert Data into a Table
Insert Into Insurance_Claims
          (RecKey,PolicyID, PolicyNumber,PolicyType,EffectiveDate,DocumentName,Submitted) 
Values    (1,2,'Pol002', 'Hospital Cover', '01-October-07','DocA',0), 
          (2,2,'Pol002', 'Hospital Cover', '01-October-07','DocB',0), 
		  (3,2,'Pol002', 'Hospital Cover', '01-October-07','DocC',1), 
		  (4,2,'Pol002', 'Hospital Cover', '01-October-07','DocD',1), 
          (5,2,'Pol002', 'Hospital Cover', '01-October-07','DocE',1) 

--Creating Pivot  "Note Very Important "----------------
Select* from (
Select PolicyID, PolicyNumber,PolicyType,EffectiveDate,DocumentName,Submitted
From [dbo].[Insurance_Claims] 
) As SourceTable
Pivot (sum(Submitted) for DocumentName IN (DocA,DocB,DocC,DocD,DocE)) AS Targettable

d-pl



--Create A Table
Create Table [SalesData](
             [SalesID] int not null,
			 [SalesDate] datetime null,
			 [SalesCount] int not null
			 )
Drop Table SalesData

--Inserting into table
Insert Into SalesData
            (SalesID,SalesDate,SalesCount)
values
            (1, '2011-07-04 23:14:53.120', 15),
			(2, '2012-07-04 23:14:53.127', 25),
			(3, '2012-07-04 23:14:53.127', 75),
			(4, '2013-07-04 23:14:53.140', 30),
			(5, '2011-07-04 23:14:53.147', 45),
			(6, '2011-07-04 23:14:53.150', 15),
			(7, '2010-07-04 23:14:53.153', 50),
			(8, '2013-07-04 23:14:53.153', 60),
			(9, '2015-07-04 23:14:53.153', 95),
			(10,'2011-07-04 23:14:53.157', 35)
			 
			 select *
			 from SalesData
			 order by SalesDate Asc
--Getting yearly Data using Pivot
Select * From
	(
Select YEAR(SalesDate) AS 'Year',
--Avg(SalesCount) AS 'AvgSalescount',
Sum(SalesCount) AS 'TotalSalescount'
from SalesData
Group By YEAR(SalesDate)
	)As YearlySalesData
Pivot (sum(Totalsalescount) for [Year] in ([2010],[2011],[2012],[2013],[2015])
      ) As [SalesYear]


Insert Into SalesData
            (SalesID,SalesDate,SalesCount)
values
            (1, '2011-03-04 23:14:53.120', 15),
			(2, '2012-03-04 23:14:53.127', 25),
			(3, '2012-03-04 23:14:53.127', 75),
			(4, '2013-03-04 23:14:53.140', 30),
			(5, '2011-09-04 23:14:53.147', 45),
			(6, '2011-09-04 23:14:53.150', 15),
			(7, '2010-09-04 23:14:53.153', 50),
			(8, '2013-12-04 23:14:53.153', 60),
			(9, '2015-12-04 23:14:53.153', 95),
			(10,'2011-12-04 23:14:53.157', 35)
select *
from salesdata
--Quarterly Sales count 	

Select [Year],
QtrSalesYear.[1] As Q1,
QtrSalesYear.[2] As Q2,
QtrSalesYear.[3] As Q3,
QtrSalesYear.[4] As Q4
from (
     Select Year (SalesDate) As [Year],
	 DATEPART (Quarter,SalesDate) As [Quarter],
	 Count (1) As [Salescount]
	 From [dbo].[SalesData]
     Group By Year (SalesDate),
	 DATEPART (Quarter,SalesDate) )As QuarterSalesDate
Pivot (sum([Salescount]) for Quarter in ([1],[2],[3],[4])
      ) As [QtrSalesYear]
		 


--Getting The Montly Salesdata using Pivot Sum
Select * 
from (
     Select Year (SalesDate) As [Year],
	 DATENAME (Month,SalesDate) As [Month],
	 sum (Salescount) As [Salescount]
	 From [dbo].[SalesData]
     Group By Year (SalesDate),
	 DATENAME (Month,SalesDate) )As MonthSalesDate
Pivot (sum([Salescount]) for Month in ([January],[February],[March],[April],[May],[June],[July],[August],[September], [October], 
[November],[December])
      ) As [MonthlySalesYear]
		 

		 --Getting The Montly Salesdata using Pivot Count
Select * 
from (
     Select Year (SalesDate) As [Year],
	 DATENAME (Month,SalesDate) As [Month],
	 count (Salescount) As [Salescount]
	 From [dbo].[SalesData]
     Group By Year (SalesDate),
	 DATENAME (Month,SalesDate) )As MonthSalesDate
Pivot (sum([Salescount]) for Month in ([January],[February],[March],[April],[May],[June],[July],[August],[September], [October], 
[November],[December])
      ) As [MonthlySalesYear]
		 


		 --Getting The Day Salesdata using Pivot Avg
Select * 
from (
     Select Year (SalesDate) As [Year],
	 DATEPART (DAY,SalesDate) As [Day],
	 Avg (Salescount) As [Salescount]
	 From [dbo].[SalesData]
     Group By Year (SalesDate),
	 DATEPART (DAY,SalesDate) )As MonthSalesDate
Pivot (sum([Salescount]) for DAY in ([1],[2],[3],[4],[5],[6],[7])
      ) As [MonthlySalesYear]

SELECT Distinct SalesDate
FROM [dbo].[SalesData]








Truncate Table [dbo].[SalesData]
Begin Tran
Delete From 
where 
Rollback
Commit