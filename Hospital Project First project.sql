--Assignment on case statement:
drop table if exists MedalOfHonor

create table dbo.MedalOfHonor (
Id int identity (1,1) primary key,
MilRank varchar (50),
SoldierName varchar (50),
YearOfAction varchar(4)
)
insert into dbo.MedalOfHonor (MilRank, SoldierName, YearOfAction)
values
('Staff Sergeant','Ty Carter', '2009'),
('Captain', 'Florent Groberg', '2012'), 
('Major', 'William D. Swenson', '2009'), 
('Corporal', 'Frank L. Anders', '1899'), 
('First Lieutenant', 'George C. Shaw', '1903')

--Questions--
/**
Assign a pay grade as follows 
f the Mid Rank is a Sergent,show as Level 6,
if the Mid Rank is a Captain,show as Level 3,
if the Mid Rank is a Major,show as Level 4,
f the Mid Rank is a Corporal,show as Level 2,
----if the Mid Rank is a Lueitenant,show as Level 1,
---Make sure to show no rank for non of the conditions Above
---Show a new column as Grade Scale **/
Create View vwMedalOfHonorRanks_rpt as
Select *,
GradeRank = 
     Case 
	 When MilRank like '%Sergeant%' Then 'Level 6'
	 When MilRank like '%Captain%' Then 'Level 3'
	 When MilRank like '%Major%' Then 'Level 4'
	 When MilRank like '%Corporal%' Then 'Level 2' 
	 When MilRank like '%Lieutenant%' Then 'Level 1' 
	 END  
	 FROM dbo.MedalOfHonor

select * 
from vwMedalOfHonorRanks_rpt

--Assignment is to learn about SQL joins regarding our healthcare project. I will discuss further in depth in our next session: 

--Hospital project questions and answers 1-10

--QUESTION 1: Write a query that does the following: Lists out number of patients in descending order,Does not include city Quincy,
--Must have at least 2 patients from that city

SELECT DISTINCT 
	   CITY, 
	   COUNT(ID) AS P
FROM PATIENTS
WHERE CITY <> 'QUINCY'
GROUP BY CITY
HAVING COUNT(ID) > 1
ORDER BY CITY DESC


--QUESTION 2: find out the patients with the highest number of visits
WITH VISITS AS
		(
	SELECT DISTINCT 
		B.CITY,
		A.PATIENT,
		B.ID,
		COUNT(B.ID) AS NUMBEROFVISITS
	FROM ENCOUNTERS A
		JOIN PATIENTS B 
		ON A.PATIENT=B.ID
	GROUP BY B.CITY,A.PATIENT,B.ID
		)
SELECT *
FROM VISITS
WHERE NUMBEROFVISITS =
	(
	SELECT 
	MAX(NUMBEROFVISITS) AS MAXVISITS
	FROM VISITS
	);

--QUESTION 3: To find out the Top 10 patients with the most visits to the hospital
WITH VISITS AS
		(
	SELECT  
		B.CITY,
		A.PATIENT,
		B.ID,
		COUNT(B.ID) AS NUMBEROFVISITS
	FROM ENCOUNTERS A
		JOIN PATIENTS B 
		ON A.PATIENT=B.ID
	GROUP BY 
		B.CITY,
		A.PATIENT,
		B.ID
		)

SELECT 
	TOP 10 *
FROM VISITS
ORDER BY NUMBEROFVISITS DESC;

?-- QUESTION 4: To find out the number of times patients from each city visited the hospital
SELECT DISTINCT
	B.CITY,
	A.PATIENT,
	B.ID,
	COUNT(B.ID) AS NUMBEROFVISITS
FROM ENCOUNTERS A
	JOIN PATIENTS B 
	ON A.PATIENT=B.ID
GROUP BY 
	B.CITY,
	A.PATIENT,
	B.ID
ORDER BY NUMBEROFVISITS DESC;

--QUESTION 5: ?To find out the cities with up to 50 counts of emergency cases.
SELECT DISTINCT
	B.CITY,
	A.ENCOUNTERCLASS,
	COUNT(ENCOUNTERCLASS) AS COUNTSOFEMERGENCYCASES
FROM ENCOUNTERS A
	JOIN PATIENTS B 
	ON A.PATIENT=B.ID
WHERE ENCOUNTERCLASS = 'EMERGENCY'
GROUP BY 
B.CITY,
A.ENCOUNTERCLASS
HAVING COUNT(ENCOUNTERCLASS) >= 50
ORDER BY COUNTSOFEMERGENCYCASES DESC
;

--QUESTION 6: ?Now to find out the number of patients from Boston who came in 2020
SELECT 
	B.CITY,
	COUNT(A.PATIENT) AS NUMBEROFPATIENTS
FROM ENCOUNTERS A
	JOIN PATIENTS B 
	ON A.PATIENT=B.ID
WHERE B.CITY = 'BOSTON' 
	AND START LIKE '2020%'
GROUP BY 
B.CITY;

-- QUESTION 7: To find out the top recurring conditions.
WITH RECCURRINGCONDITIONS AS
	(
	SELECT DISTINCT 
		A.DESCRIPTION,
		COUNT(*) AS NUMBEROFRECURRENCE
	FROM CONDITIONS A
		JOIN PATIENTS B 
		ON A.PATIENT=B.ID
	GROUP BY A.DESCRIPTION
	)
SELECT 
	TOP 5 DESCRIPTION,
	NUMBEROFRECURRENCE
FROM RECCURRINGCONDITIONS
ORDER BY NUMBEROFRECURRENCE DESC;


--QUESTION 8: To find out the month with the highest number of ambulatory cases since 2010
SELECT 
	TOP 1 NUMBEROFAMBULATORYCASES,
	YEAR,
	MONTH
FROM
	(
	SELECT DISTINCT
		DATEPART(YEAR, A.START) AS YEAR,
		DATEPART(MONTH, A.START) AS MONTH,
		COUNT(A.ENCOUNTERCLASS) AS NUMBEROFAMBULATORYCASES
	FROM ENCOUNTERS A
		JOIN PATIENTS B 
		ON A.PATIENT=B.ID
	WHERE ENCOUNTERCLASS = 'AMBULATORY'
	GROUP BY 
		DATEPART(YEAR, A.START), 
		DATEPART(MONTH, A.START)
	HAVING DATEPART(YEAR, A.START) >= 2010
	) X
 ORDER BY NUMBEROFAMBULATORYCASES DESC

--QUESTION 9: ?To find out the month with the highest number of emergency cases since 2010.

SELECT 
	TOP 1 NUMBEROFEMERGENCYCASES,
	YEAR,
	MONTH
FROM
	(
	SELECT DISTINCT
		DATEPART(YEAR, A.START) AS YEAR,
		DATEPART(MONTH, A.START) AS MONTH,
		COUNT(A.ENCOUNTERCLASS) AS NUMBEROFEMERGENCYCASES
	FROM ENCOUNTERS A
		JOIN PATIENTS B 
		ON A.PATIENT=B.ID
	WHERE ENCOUNTERCLASS = 'EMERGENCY'
	GROUP BY 
		DATEPART(YEAR, A.START), 
		DATEPART(MONTH, A.START)
	HAVING DATEPART(YEAR, A.START) >= 2010
	) X
ORDER BY NUMBEROFEMERGENCYCASES DESC

 --QUESTION 10: ?Now to find out the top 15 years with the most immunizations.
SELECT 
	TOP 15 NUMBEROFIMMUNIZATIONS,
	YEAR
FROM
	(
	SELECT DISTINCT
		DATEPART(YEAR, A.DATE) AS YEAR,
		COUNT(A.ENCOUNTER) AS NUMBEROFIMMUNIZATIONS
	FROM IMMUNIZATIONS A
		JOIN PATIENTS B 
		ON A.PATIENT=B.ID
	GROUP BY 
		DATEPART(YEAR, A.DATE) )X
ORDER BY NUMBEROFIMMUNIZATIONS DESC;
	 