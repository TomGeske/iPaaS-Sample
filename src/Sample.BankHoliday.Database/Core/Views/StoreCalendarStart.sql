
CREATE VIEW [Core].[StoreCalendarStart]
AS

  SELECT [DayTable].*
       , [Store].[Store_Id]
	   , [Store].[StoreName]
	   , [Store].[Canton]
	   , [Store].[Streeet]
	   , [Store].[PLZ]
	   , [Store].[City]
	   , [WeekKalendarDetail].[FullDayPattern]
	   , [WeekKalendarDetail].[HalfDayPattern]
  FROM [Core].[DayTable]
   CROSS JOIN [Core].[Store]
     INNER JOIN [Core].[WeekKalendar]
        ON [Store].[WeekKalendar_Id] = [WeekKalendar].[WeekKalendar_Id]
     INNER JOIN [Core].[WeekKalendarDetail]
        ON [WeekKalendar].[WeekKalendar_Id] = [WeekKalendarDetail].[WeekKalendar_Id]
  	 AND [DayTable].[WeekDay] =[WeekKalendarDetail].[WeekDay]
  --ORDER BY Store_Id, [DayTable].[Date]