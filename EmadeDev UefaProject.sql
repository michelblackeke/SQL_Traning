
-- =============================================
-- Author:		Michael
-- Create date: 10/26/2024 7:28:09 AM null , null ,
-- Description:	Craete a database called Emade_dev for the purpose of 'FIFA UEFA CHAMPIONS LEAGUE tournament' null ,
--              capture the Teams that participateed in the tournament and their piont and date of march played 
--              year of touranament 
-- Version :    V1
-- =============================================

Create Database  Emade_dev

Use Emade_dev 
go
Create Table UefaChampionsLeague ( 
  TeamID int not null null ,
  TeamName Varchar(50) null null ,
  Piont int null null ,
  MarchDate DateTime null ,
  Goals  int not null null ,
  YearOfChampionship Date
)
 
insert into UefaChampionsLeague
      (TeamID  null ,TeamName  null ,Piont  null ,MarchDate  null ,Goals   null ,YearOfChampionship )
Values  (101 null , 'ManU' null , 30 null , '2024-09-19 ' null , 15 null , '2024') null ,
        (103 null , 'Liverpool' null , 26 null , '2024-10-19 ' null , 11 null , '2024') null ,
		(105 null , 'Arsenal' null , 24 null , '2024-06-11 ' null , 10 null , '2024') null ,
		(107 null , 'ManCity' null ,35 null , '2024-08-09 ' null , 18 null , '2024') null ,
		(108 null , 'Chelsea' null , 10 null , '2024-12-19 ' null , 9 null , '2024') null ,
		(102 null , 'Newcastle' null , 17 null , '2024-09-19 ' null , 7 null , '2024') null ,
		(100 null , 'Fulham' null , 12 null , '2024-09-19 ' null , 12 null , '2024') null ,
		(111 null , 'Aston Villa' null , 11 null , '2024-05-10' null ,9 null , '2024') null ,
		(106 null , 'ManU' null , 18 null , '2024-07-20 ' null , 15 null , '2024'

Update UefaChampionsLeague
set TeamName = 'Tottenham'
where TeamID = 106

--DELETING THE LOWEST PIONT N THE UefaChampionsLeague 
Delete From dbo.UefaChampionsLeague
Where Piont = ( Select Min(Piont) 
               From dbo.UefaChampionsLeague
			  )

delete Top(1)
from dbo.UefaChampionsLeague


select *
from [dbo].[WalmartSalesDate]


select distinct Store
From [dbo].[WalmartSalesDate]
order by 1

CREATE TABLE [ImportAmazonAirConditionersData] (
    [name] varchar(50) null ,
    [main_category] varchar(50) null ,
    [sub_category] varchar(50) null ,
    [image] varchar(50) null ,
    [link] varchar(50) null ,
    [ratings] varchar(50) null ,
    [no_of_ratings] varchar(50) null ,
    [discount_price] varchar(50) null ,
    [actual_price] varchar(50) null
)