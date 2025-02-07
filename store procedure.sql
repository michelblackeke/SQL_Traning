--why use a store procedure 
--its use for security
--use to improve code performace
--use for automatiuon purposes
--use for logging purpose/ troubleshooting

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Deverloper:		<Michael,,Ekeoma>
-- Create date: <2025-01-25,,>
-- Description:	<Inital process to create procedure to pull allergy data,,>
--Change date : 2025-0125 - added parameter to the procedure , created a verrable category to sort record based on categort
-- =============================================
Create or Alter PROCEDURE sp_PullAllergydata

  --Declare @StartDate INT
  --Declare 
   (@CATEGORY varchar(50),
	 --@Start date
	 @startyear date
	 )
	 --YEAR = @STARTYEAR
	 
	 --set @startYEAR = LEFT(START, 4) --CONVERT (VARCHAR(4), [START]
 AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;

	-- insert statements for the procedure . 
SELECT [START]
      ,YEAR(START) AS STARTYEAR
      ,[STOP]
      ,[PATIENT]
      ,[ENCOUNTER]
      ,[CODE]
      ,[SYSTEM]
      ,[DESCRIPTION]
      ,[TYPE]
      ,[CATEGORY]
      ,[REACTION1]
      ,[DESCRIPTION1]
      ,[SEVERITY1]
      ,[REACTION2]
      ,[DESCRIPTION2]
      ,[SEVERITY2]
  FROM [Emade_dev].[dbo].[allergies]

 where [CATEGORY] = @CATEGORY
 --and [START] = @Startdate
 and LEFT(START, 4) = @STARTYEAR
END
GO



	---- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>