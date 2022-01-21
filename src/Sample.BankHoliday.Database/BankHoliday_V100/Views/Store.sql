
CREATE VIEW [BankHoliday_V100].[Store]
AS


SELECT [Store_Id] AS [StoreId]
      ,[StoreName]
      ,[Canton]
      ,[Streeet]
      ,[PLZ]
      ,[City]
      ,[StoreType]
      ,[WeekKalendar_Id] AS [WeekKalendarId]
FROM [Core].[Store]