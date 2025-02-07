--Select top 100 *
--From CovidProject.dbo.CovidDealthRec

--BULK INSERT PROCESS TO LOAD DATA
--loading care plan csv file into dev
drop table if exists directors

--use Tech52Class

--create table to insert data 
create table directors (
[Director id number] int null ,
FullName varchar(50) null,
DoB varchar(50)null ,
Gender varchar (50)null,
imp date
)
 --bulk insert
 bulk insert Directors
 from 'C:\Users\user\Documents\Directors\Directors.csv'
with
(format='csv', firstrow = 2,
fieldterminator=',',
rowterminator='0x0a'
)

select * 
from Directors


update Directors
set imp = GETDATE()