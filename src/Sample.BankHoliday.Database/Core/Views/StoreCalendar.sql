
CREATE VIEW [Core].[StoreCalendar]
AS

SELECT  [StoreCalendarWithPublicHolidays].[Store_Id]
	   ,[StoreCalendarWithPublicHolidays].[Date]
	   ,[StoreName]
	   ,[Canton]
	   ,[Streeet]
	   ,[PLZ]
	   ,[City]
       ,CASE WHEN [PublicHolidaysName] IS NOT NULL THEN CONVERT(VARCHAR(50), 'BankHoliday')
	                                               ELSE CONVERT(VARCHAR(50), 'WorkingDay')		  
		END                                                               AS [DayType]
	   ,CASE WHEN [OverwriteBusinessLogic].[Action] IS NOT NULL THEN [OverwriteBusinessLogic].[OpenHours]
	                                                            ELSE [PublicHolidaysOpening]
		END                                                               AS [Opening]
	   ,COALESCE([OverwriteBusinessLogic].[Action], [PublicHolidaysName]) AS [Reason]
	   ,[OverwriteBusinessLogic].[Comment]
FROM [Core].[StoreCalendarWithPublicHolidays]
  LEFT OUTER JOIN [Core].[OverwriteBusinessLogic]
    ON [StoreCalendarWithPublicHolidays].[Date]     = [OverwriteBusinessLogic].[Date]
   AND [StoreCalendarWithPublicHolidays].[Store_Id] = [OverwriteBusinessLogic].[Store_Id]