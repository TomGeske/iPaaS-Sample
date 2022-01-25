
CREATE VIEW [Core].[StoreCalendar]
AS

SELECT  [StoreCalendarWithPublicHoliday].[Store_Id]
	   ,[StoreCalendarWithPublicHoliday].[Date]
	   ,[StoreName]
	   ,[Canton]
	   ,[Streeet]
	   ,[PLZ]
	   ,[City]
       ,CASE WHEN [PublicHolidayName] IS NOT NULL THEN CONVERT(VARCHAR(50), 'BankHoliday')
	                                               ELSE CONVERT(VARCHAR(50), 'WorkingDay')		  
		END                                                               AS [DayType]
	   ,CASE WHEN [OverwriteBusinessLogic].[Action] IS NOT NULL THEN [OverwriteBusinessLogic].[OpenHours]
	                                                            ELSE [PublicHolidayOpening]
		END                                                               AS [Opening]
	   ,COALESCE([OverwriteBusinessLogic].[Action], [PublicHolidayName]) AS [Reason]
	   ,[OverwriteBusinessLogic].[Comment]
FROM [Core].[StoreCalendarWithPublicHoliday]
  LEFT OUTER JOIN [Core].[OverwriteBusinessLogic]
    ON [StoreCalendarWithPublicHoliday].[Date]     = [OverwriteBusinessLogic].[Date]
   AND [StoreCalendarWithPublicHoliday].[Store_Id] = [OverwriteBusinessLogic].[Store_Id]