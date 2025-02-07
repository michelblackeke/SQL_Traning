Use Emade_dev

select * 
from [dbo].[InsuranceClaims]

Select *
From 
(
Select [RecKey],[Pol_ID],[Pol_Number],[Pol_Type],[Effective_Date],[Doc_ID],[Doc_Name],[Submitted]
From InsuranceClaims
group by [RecKey],[Pol_ID],[Pol_Number],[Pol_Type],[Effective_Date],[Doc_ID],[Doc_Name],[Submitted]
) as Source_table
Pivot (count ([Doc_Name])
For [Doc_Name] in ([DocA], [DocB], [DocC], [DocD], [DocE], [DocF])) as Target_table


Select *
From 
(
Select [RecKey],[Pol_ID],[Pol_Number],[Pol_Type],[Effective_Date],[Doc_ID],[Doc_Name],[Submitted]
From InsuranceClaims
group by [RecKey],[Pol_ID],[Pol_Number],[Pol_Type],[Effective_Date],[Doc_ID],[Doc_Name],[Submitted]
) as Source_table
Pivot (avg ([Submitted])
For [Pol_Number] in ([Pol002],[Pol003])) as Target_table


--UAT 
select *,
case
when [Submitted] = 1 then 'Submitted'
else 'Not Submitted'
end as Track
from InsuranceClaims


select Effective_Date, Submitted, 
lag(submitted) over (order by effective_date) as previousdate
from InsuranceClaims

