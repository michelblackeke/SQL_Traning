create database recon1

select distinct  m.F4 As Masterschoolname,
b.F4
from [dbo].[Master] m,[dbo].[Master2] b
where b.F2 = m.F2
and m.F4 != b.F4 

select * from Master2, Master