
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Developer:		<Michael Ekeom>
-- Create date: <2025-02-01>
-- Description:	<incrimentaload for Emade Customer using merge / scd type2 >
-- =============================================
CREATE PROCEDURE spEmadeCustomer
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--PERFORMING MERGE OPERATIONS
	INSERT INTO EMADE_SCD_EMPLOYEE (ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE)
SELECT ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE 
FROM (
    MERGE INTO EMADE_SCD_EMPLOYEE AS TARGET
    USING STG_EMADE_SCD_EMPLOYEE AS SOURCE
    ON TARGET.ID = SOURCE.ID AND TARGET.IS_ACTIVE = 'Y'
    WHEN MATCHED THEN
        UPDATE SET 
            TARGET.IS_ACTIVE = 'N',
            TARGET.END_DATE = GETDATE()
    WHEN NOT MATCHED THEN
        INSERT (ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE)
        VALUES (SOURCE.ID, SOURCE.NAME, SOURCE.SALARY, SOURCE.START_DATE, NULL, 'Y')
    OUTPUT $ACTION,
        SOURCE.ID,
        SOURCE.NAME,
        SOURCE.SALARY,
        GETDATE(),
        NULL,
        'Y'
) AS [CHANGES] (ACTION, ID, NAME, SALARY, START_DATE, END_DATE, IS_ACTIVE)
WHERE ACTION = 'Update';

END
GO
