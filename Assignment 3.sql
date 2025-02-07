--How To Create A Database
Create Database Games
;

--How To Use A Database
Use Games
;

--Check Data In Table
Select *
From Games
;

Select *
From Games
Where GameYear = '2004'

Select *
From Games
Where GameCity = 'London'

--Inner Query, Outer Query, Sub Query
Select *
From Games
Where Gameyear = (Select Max (GameYear) 
From Games
)

--How To Load Data In A Table
Insert Into Games
Values (5, '2024', 'Paris')


--How To Create A View 
Create View vwGames As
Select *
From Game 

Select *
From vwGames
Where Gameyear < '2008'


--How To Check How Many Record In A Table
Select Count(*) As Totalrecord
From vwGames

--How to Exculde Data From A Table
Select *
From vwGames

Select *
From vwGames
Where GameCity Not In ('London','Athens')


