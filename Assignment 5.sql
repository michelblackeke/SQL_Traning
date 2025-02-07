/**
Create a database and name it SQLTrainingCase if you haven’t created one yet
1.Create a table and name it CompanyInfo
. Load the data to the CompanyInfo table
. Write a case statement to show all the fields in the table CompanyInfo, if the
county are Canada and USA, you should show the continent as North America but
show the continent as Europe if the country is UK

FIRST_NAME LAST_NAME COUNTRY
Adam Cooper USA
John Smith USA
Mark Allan UK
Sally Jones USA
Steve Brown Canada

1. Create a table and name it EmployeeInfo
. Load the data to the EmployeeInfo table
. Write a case statement to show all the fields in the table EmployeeInfo, if the
employees are not more than 1 you should show the SizeOfCompany as No
Employees,
if the employees are not more than 10 you should show the SizeOfCompany as Small,
if the employees are not more than 50 or same as 50 you should show the
SizeOfCompany as Medium but show the SizeOfCompany as Large if the number of
employees more than 50
write a query to show the total number of employees
write a query to show the average number of employee

FIRST_NAME LAST_NAME EMPLOYEES
Adam Cooper 55
John Smith 4
Mark Allan 23
Sally Jones 10
Steve Brown 15
Michael James 1
**/

--How To Create A Database
Create Database SQLTrainingCase
;

--How To Use A Database
Use SQLTrainingCase
;

-- How To Create A Table
Create Table [CompanyInfo](
[ID] [int] NOT NULL,
[FirstName] [Varchar](50) NULL,
[LastName] [Varchar](50) NULL,
[Country] [Varchar](50) NULL
)

Select *
From CompanyInfo

--How To Load A Table Into A Table
Insert Into CompanyInfo
(ID,FirstName,LastName,Country)
Values (1,'Adam','Cooper','USA'),
	   (2,'John','Smith','USA'),
       (3,'Mark','Allan','UK'),
       (4,'Sally','Jones','USA'),
       (5,'Steve','Brown','Canada')

Select FirstName,LastName,Country, count(Country) as CountryCount
From CompanyInfo
group by FirstName,LastName,Country
Having count(Country)>1

Select *
From 
(
Select FirstName,LastName,Country, count(Country) as CountryCount
From CompanyInfo
group by FirstName,LastName,Country
) A
Where CountryCount > 1

--How To Write A Case Statement
Select *
From CompanyInfo w

Select *,
Case When Country in ('Canada','USA') Then 'North America'
When Country in ('Uk') Then 'Europe'
End As continent
From CompanyInfo 

--How To Create A Table
Create Table [EmployeeInfo](
[ID] [int] NOT NULL,
[Firstname] [Varchar](50) NULL,
[Lastname] [Varchar](50) NULL,
[Employees] [Varchar](50) NULL
)

--How To Load Data In A Table
Insert into EmployeeInfo
(ID,Firstname,Lastname,Employees)
Values (1,'Adam','Cooper','55'),
       (2,'John','Smith','4'),
       (3,'Mark','Allan','23'),
       (4,'Sally','Jones','10'),
       (5,'Steve','Brown','15'),
       (6,'Michael','James','1')
Select *
From EmployeeInfo

--How To Write A Case Statement
Select *
From EmployeeInfo 

Select *,
Case When Employees  <= 1 Then 'NO Employees' 
When Employees <10 Then 'Small Employees'
When Employees <=50 Then 'Medium Employees'
Else 'Large Employees'
End As SizeOfCompany
From Employeeinfo


--How To Check How Many Record In A Table


Select *
From EmployeeInfo

--Inner Query, Outer Query, Sub Query
Select *
From EmployeeInfo
Where Employees = 
	(Select sum (Employees)
	From EmployeeInfo
	) group by Lastname, Firstname,Employees

	Select avg (Employees) As Avgcount
	From EmployeeInfo

-- How To Modify A Table
Alter Table EmployeeInfo 
Alter Column Employees [int] NULL


Create Table Games(
                  PlayerID int not null,
				  DeviceID int not null,
				  EventDate Date,
				  Gamesplayed int not null
				  )
--Drop table Games
Insert Into Games
           (PlayerID,DeviceID,EventDate,Gamesplayed)
Values     (1,2,'2021-08-09',9),
           (1,2,'2021-04-07',3),
		   (2,3,'2021-06-25',1),
		   (3,1,'2021-03-02',1),
		   (3,4,'2021-07-03',3)

Select PlayerID, min(EventDate) As FirstLogin 
From Games 
Group by PlayerID

Select PlayerID,EventDate As FirstLogin
From
(
Select playerID,EventDate, 
ROW_NUMBER() Over(Partition By PlayerID Order by EventDate) AS Seq
From Games
)As t
Where Seq = 1

CREATE VIEW vwGames AS
Select *
From Games
where playerID = 1

Drop View vwGames 

select *
From vwGames

Create Table Emp_HrTable(
           Employee_id int not null Primary Key,
		   First_Name Varchar(50) null,
		   Last_Name Varchar (50) null,
		   Job_title Varchar (100) null,
		   Salary Money null,
		   Reports_to Int not null,
		   Office_id int not null
		   )
Insert Into Emp_HrTable
         (Employee_id,First_Name,Last_Name,Job_title,Salary,Reports_to,Office_id)
Values   (33391,'Darcy','Nortunen','Account Executive',62871,37270,1),
         (37270,'Yovonnda','Magrannell','Executive Secretary',63996,'  ',10),
		 (37851,'Sayer','Matterson','Statistician III', 98926,37270,1),
		 (40448,'Mindy','Crissil','Staff Scientist',94860,37270,1),
		 (56274,'Keriann','Alloisi','Vp Marketing',110150,37270,1),
		 (63196,'Alaster','Scutchin','Assistant Professor',32179,37270,2),
		 (67009,'North','de Clerc','Vp Product Management',114257,37270,2),
		 (67370,'Elladine','Rising','Social Worker',96767,37270,2),
		 (68249,'Nisse','Voysey','Financial Advisor',52832,37270,2),
		 (72540,'Guthery','Iacopetti','Office Assistant I',117690,37270,3),
		 (72913,'Kass','Hafferan','Computer System Analysis',96401,37270,3),
		 (75900,'Virge','Goodrum','Information System Management',54578,37270,3),
		 (76196,'Mirila','Janowski','Cost Accountant',119241,37270,3),
		 (80529,'Lynde','Aronson','Junior Executive',77182,37270,4),
		 (80679,'Mildris','Sokale','Gelogist II',67987,37270,4)

Select *
From Emp_HrTable

--Using Case Statment using comparison operator to evalute an expression 
Select Employee_id, Job_title,Salary,
Case
    When Salary >= 50000 Then 'High Salary'
	When Salary = 50000 Then 'Mid Salary'
	Else 'Low Salary'
	End As SalaryText
	From Emp_HrTable
	Order By Employee_

Insert Into Games
           (PlayerID,DeviceID,EventDate,Gamesplayed)
Values     (1,2,'2021-08-09',9),
           (1,2,'2021-04-07',3),
		   (2,3,'2021-06-25',1),
		   (3,1,'2021-03-02',1),
		   (3,4,'2021-07-03',3)

		   Select *
		   From Games 

Select EventDate, 
ROW_NUMBER() Over(Order By Gamesplayed desc) As 'GamesplayedRows',
Rank() Over(Order By Gamesplayed Desc) As 'GamesRank',
Dense_Rank() Over(Order By Gamesplayed Desc) As 'GamesPlayedDenseRank'
From Games 
Order by 1,2,3


Select Job_title, 
ROW_NUMBER() Over(Order By Salary desc) As 'Salary_RowNumer',
Rank() Over(Order By Salary Desc) As 'Salary_Rank'
From Emp_HrTable

 




Select First_Name, Office_id, Salary
From Emp_HrTable
order by Case Office_id 
when '1' Then Salary End Desc,
Case when '2' Then Salary 
End;

--Suppose we want to group based on their salries and calculate the maximum and minmum salary for a specified range of emp_hrtable data
Select 
Case 
   When Salary >=80000 AND Salary <= 150000 Then 'Executive Level'
   When Salary >=50000 AND Salary <80000 Then 'Senior Level'
   Else 'Mid level'
   End As Designation,
   Min(Salary) As MinimumSalary,
   Max(Salary) AS MaximumSalary,
   Avg(Salary) As AvgSalary
   From Emp_HrTable
   Group By 
   Case 
   When Salary >=80000 AND Salary <= 150000 Then 'Executive Level'
   When Salary >=50000 AND Salary <80000 Then 'Senior Level'
   Else 'Mid level'
   End
Select *
FRom Emp_HrTable
-- Using Case Statement to upadate 
Update 

--How to use rank
Select First_Name, Rank() Over(order by Salary desc) as Salary_ranking
From Emp_HrTable

Select First_Name, Salary, 
     ROW_NUMBER() Over(order by Salary desc) as R_row,
     Rank() Over(order by Salary Desc) As ranksalary,
     DENSE_RANK() over(order by salary Desc) as Salary
from Emp_HrTable

Select EventDate,
ROW_NUMBER() Over(Order By Gamesplayed Desc) Event_Row,
Rank() Over(Order By Gamesplayed Desc) Event_Rank,
Dense_rank() Over(Order By Gamesplayed Desc) Event_DenseRank
From Games
Order By 1,2,3 asc

Select First_Name,
Case 
 When ((DENSE_RANK () Over (Order By Salary desc))) = 3 Then  'Salary_rank'
 End  HighestPaid
 from Emp_HrTable

 --How to shearch a word using an single Apherbet 
 Select First_Name 
 from Emp_HrTable 
 where First_Name Like '%S'

 Alter Procedure spLastNameChange
 @First_Name Varchar(50),
 @Last_Name Varchar (50) Output
 As
 Begin 
     Select @Last_Name=@Last_Name
	 From [Emp_HrTable].[Emp_HrTable]
	 Where @First_Name = @First_Name
	 End