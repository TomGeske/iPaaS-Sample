
CREATE VIEW [BankHoliday_V100].[OverwriteBusinessLogic]
AS

  SELECT [OverwriteBusinessLogic_Id]
        ,[Store_Id]
        ,[Action]
        ,[Date]
        ,[OpenHours]
        ,[Comment]
  FROM   [Core].[OverwriteBusinessLogic]