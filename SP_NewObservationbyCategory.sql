
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
--Developer:		<Michael Ekeoma>
-- Create date: <2025-02-02>
-- Description:	<Process to pull observations table by Category and date>
-- =============================================
CREATE or alter PROCEDURE spNewPullobservationsbyCategory
   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT [DATE] as StartDate
      ,[PATIENT]
      ,[ENCOUNTER]
      ,[CATEGORY] 
  FROM [Emade_dev].[dbo].[observations]

  Where CATEGORY = 'vital-signs'
  and [Date]= '2014-12-19'
	
END
GO
 --exec spNewPullobservationsbyCategory 


