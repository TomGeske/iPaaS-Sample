
CREATE VIEW [BankHoliday_V100].[OverwriteBusinessLogic]
AS

  SELECT [OverwriteBusinessLogic_Id] AS [OverwriteBusinessLogicId]
        ,[Store_Id]                  AS [StoreId]
        ,[Action]
        ,[Date]
        ,[OpenHours]
        ,[Comment]
  FROM   [Core].[OverwriteBusinessLogic]