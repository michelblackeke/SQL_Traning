SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
--Developer:		<Michael Ekeoma>
-- Create date: <2025-02-02>
-- Description:	<Process to insert observations table by Categoryand date from spPullobservationsbyCategory>
-- =============================================
 alter PROCEDURE spInsertobservationsbyCategory
    
AS
BEGIN
  Create Table #Observation(
       [DATE] date
      ,[PATIENT] varchar(100)
      ,[ENCOUNTER] varchar(100)
      ,[CATEGORY] varchar(100)	
	  );
	
	-- inserting into temp from sp
insert into #Observation
exec spNewPullobservationsbyCategory;

--Drop table if exist
drop table if exists ObservationCategory

CREATE TABLE ObservationCategory (
    [DATE] DATE,
    [PATIENT] VARCHAR(100),
    [ENCOUNTER] VARCHAR(100),
    [CATEGORY] VARCHAR(100),
    [InsertDate] DATE 
)
--Insert data into the table    
INSERT INTO ObservationCategory ([DATE], [PATIENT], [ENCOUNTER], [CATEGORY], [InsertDate])
SELECT 
    [DATE], 
    [PATIENT], 
    [ENCOUNTER], 
    [CATEGORY], 
    GETDATE()
FROM #Observation;

  --drop temp table 
drop table #Observation;

END
GO

--exec spInsertobservationsbyCategory  

--SELECT * FROM ObservationCategory