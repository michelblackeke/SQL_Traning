USE [INTERVIEW]
GO

/****** Object:  StoredProcedure [dbo].[spUpsertPetTable]    Script Date: 12/16/2023 10:35:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER Proc [dbo].[spUpsertPetTable]
As
Begin
Merge dbo.PET AS Target-- DESTINATION TABLE
Using dbo.PETBackup As Source--- SOURCE TABLE
On (Target.PetID = Source.PetID)
When NOT MATCHED BY Target Then 
Insert (PetID, PetName, PetPhone)
Values (Source.PetID, Source.PetName, Source.PetPhone)

When Matched And Target.PetName = Source.PetName
And Target.PetPhone = Source. PetPhone
Then 
Update
Set Target.PetID = Source.PetID,
Target.PetName = Source.PetName,
Target.PetPhone = Source. PetPhone
;
Select *
From PET ;
End 
GO



