Create Database AlzheimerStatistics
;
Use AlzheimerStatistics
;
drop table AlzheimerStatistics

CREATE TABLE [AlzheimerStatistics] (
    [YearStart] Varchar(50) null,
    [YearEnd] varchar(50)null, 
    [LocationDesc] varchar(50) null,
    [Age] varchar(50) null,
    [Gender] varchar(50) null
)
select *
From AlzheimerStatistics

Select count(1) As Total_Rec
from AlzheimerStatistics

Select YearStart,YearEnd,LocationDesc,Age, 
Case 
   When Age ='65 years or older' Then 'High_Alzherimer' --- Condition 1
   When Age = '61.7' Then 'less_high_Alzherimer'
   When Age = '50-64 years' Then 'Midum_Alzherimer' ---- condition 2
   Else 'Low_Alzherimer' --- Condition 3
   End As Age_Statistics
   from AlzheimerStatistics
   order by Age_Statistics asc

--Saving result in another table 

Select distinct LocationDesc into Temp
from AlzheimerStatistics
order by LocationDesc 

Select * from Temp

Select * 
From Temp
where LocationDesc like '_%N%'

--remove space in a table
Select  LocationDesc, Trim(LocationDesc) As LocationTrim
From AlzheimerStatistics

select serverproperty('DESKTOP-M792K44\SQLEXPRESS') as hostname
select DB_NAME() AS databasename