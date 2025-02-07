Use HOSPITAL2

Create Schema H_ROOM
;

SELECT * FROM ROOM

Select *
Into H_ROOM.ROOM From [dbo].[ROOM]

Create Proc spHospitalUpsertTable
As
Begin
Merge [dbo].[ROOM] As Target
Using [H_ROOM].[ROOM] AS Source
On (Target.ROOMNUMBER = Source. ROOMNUMBER)
When Not Matched By Target Then 
Insert (ROOMNUMBER, ROOMTYPE, BLOCKFLOOR, BLOCKCODE, UNAVAILABLE)
VALUES (Source.ROOMNUMBER, Source.ROOMTYPE, Source.BLOCKFLOOR, Source.BLOCKCODE, Source.UNAVAILABLE)
When Matched And Target.ROOMTYPE = Source.ROOMTYPE
And Target.BLOCKFLOOR = Source.BLOCKFLOOR
AND Target.BLOCKCODE = Source.BLOCKCODE
AND Target.UNAVAILABLE = Source.UNAVAILABLE
THEN 
UPDATE 
SET Target.ROOMTYPE = Source.ROOMTYPE,
    Target.BLOCKFLOOR = Source.BLOCKFLOOR,
    Target.BLOCKCODE = Source.BLOCKCODE,
    Target.UNAVAILABLE = Source.UNAVAILABLE
;
Select *
from ROOM
END 
GO
drop proc spHospitalUpsertTable
Exec spHospitalUpsertTable

