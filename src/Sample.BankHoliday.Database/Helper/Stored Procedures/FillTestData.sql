
CREATE PROCEDURE [Helper].[FillTestData]
AS
BEGIN
  DELETE FROM [Core].[WeekKalendar]

  INSERT INTO [Core].[WeekKalendar] ([WeekKalendarName]) VALUES ('Mo-Fr: 08:00-20:00; Sa: 07:30-18:00; So: Closed; Mo-Fr: 08:00-12:00; Sa: 07:30-12:30; So: Closed')
  INSERT INTO [Core].[WeekKalendar] ([WeekKalendarName]) VALUES ('Mo-Fr: 06:30-12:15, 14:00-18:30; Sa: 06:30-14:00; So: Closed; Mo-Fr: 06:30-12:30; Sa: 06:30-12:30; So: Closed')

  ;WITH Days
  AS
  (
              SELECT 2 AS [WeekDay], '08:00-20:00' AS [FullDayPattern], '08:00-12:00' AS [HalfDayPattern]  -- Monday
    UNION ALL SELECT 3 AS [WeekDay], '08:00-20:00' AS [FullDayPattern], '08:00-12:00' AS [HalfDayPattern]  -- Tuesday
    UNION ALL SELECT 4 AS [WeekDay], '08:00-20:00' AS [FullDayPattern], '08:00-12:00' AS [HalfDayPattern]  -- Wednesday
    UNION ALL SELECT 5 AS [WeekDay], '08:00-20:00' AS [FullDayPattern], '08:00-12:00' AS [HalfDayPattern]  -- Thursday
    UNION ALL SELECT 6 AS [WeekDay], '08:00-20:00' AS [FullDayPattern], '08:00-12:00' AS [HalfDayPattern]  -- Friday
    UNION ALL SELECT 7 AS [WeekDay], '08:00-12:00' AS [FullDayPattern], '07:30-12:30' AS [HalfDayPattern]  -- Saturday
    UNION ALL SELECT 1 AS [WeekDay], 'Closed'      AS [FullDayPattern], 'Closed'      AS [HalfDayPattern]  -- Sunday
  )
  INSERT INTO [Core].[WeekKalendarDetail]
  (
     [WeekKalendar_Id]
	,[WeekDay]
	,[FullDayPattern]
	,[HalfDayPattern]
  )
  SELECT [WeekKalendar_Id]
        ,[WeekDay]
	    ,[FullDayPattern]
	    ,[HalfDayPattern]
  FROM [Core].[WeekKalendar]
    CROSS JOIN Days
  WHERE [WeekKalendarName] = 'Mo-Fr: 08:00-20:00; Sa: 07:30-18:00; So: Closed; Mo-Fr: 08:00-12:00; Sa: 07:30-12:30; So: Closed'

  ;WITH Days
  AS
  (
              SELECT 2 AS [WeekDay], '06:30-12:15, 14:00-18:30' AS [FullDayPattern], '06:30-12:30' AS [HalfDayPattern]  -- Monday
    UNION ALL SELECT 3 AS [WeekDay], '06:30-12:15, 14:00-18:30' AS [FullDayPattern], '06:30-12:30' AS [HalfDayPattern]  -- Tuesday
    UNION ALL SELECT 4 AS [WeekDay], '06:30-12:15, 14:00-18:30' AS [FullDayPattern], '06:30-12:30' AS [HalfDayPattern]  -- Wednesday
    UNION ALL SELECT 5 AS [WeekDay], '06:30-12:15, 14:00-18:30' AS [FullDayPattern], '06:30-12:30' AS [HalfDayPattern]  -- Thursday
    UNION ALL SELECT 6 AS [WeekDay], '06:30-12:15, 14:00-18:30' AS [FullDayPattern], '06:30-12:30' AS [HalfDayPattern]  -- Friday
    UNION ALL SELECT 7 AS [WeekDay], '06:30-14:00' AS [FullDayPattern],              '06:30-12:30' AS [HalfDayPattern]  -- Saturday
    UNION ALL SELECT 1 AS [WeekDay], 'Closed'      AS [FullDayPattern],              'Closed'      AS [HalfDayPattern]  -- Sunday
  )
  INSERT INTO [Core].[WeekKalendarDetail]
  (
     [WeekKalendar_Id]
	,[WeekDay]
	,[FullDayPattern]
	,[HalfDayPattern]
  )
  SELECT [WeekKalendar_Id]
        ,[WeekDay]
	    ,[FullDayPattern]
	    ,[HalfDayPattern]
  FROM [Core].[WeekKalendar]
    CROSS JOIN Days
  WHERE [WeekKalendarName] = 'Mo-Fr: 06:30-12:15, 14:00-18:30; Sa: 06:30-14:00; So: Closed; Mo-Fr: 06:30-12:30; Sa: 06:30-12:30; So: Closed'


  -- 
  DELETE FROM [Core].[Store];


  INSERT INTO [Core].[Store]
             ([StoreName]
             ,[Canton]
             ,[Streeet]
             ,[PLZ]
             ,[City]
             ,[StoreType]
             ,[WeekKalendar_Id]
             )
   SELECT 'Denner Discount Frick'
          ,'AG'
          ,'Widengasse 1'
		  ,5070 
		  ,'Frick'
		  ,'Denner Discount'
		  ,[WeekKalendar_Id]
   FROM [Core].[WeekKalendar]
   WHERE [WeekKalendarName] = 'Mo-Fr: 08:00-20:00; Sa: 07:30-18:00; So: Closed; Mo-Fr: 08:00-12:00; Sa: 07:30-12:30; So: Closed'
           
  INSERT INTO [Core].[Store]
             ([StoreName]
             ,[Canton]
             ,[Streeet]
             ,[PLZ]
             ,[City]
             ,[StoreType]
             ,[WeekKalendar_Id]
             )
   SELECT 'Denner Satellit Gansingen'
          ,'AG'
          ,'Postpl. 3'
		  ,5272 
		  ,'Gansingen'
		  ,'Denner Satellit'
		  ,[WeekKalendar_Id]
   FROM [Core].[WeekKalendar]
   WHERE [WeekKalendarName] = 'Mo-Fr: 06:30-12:15, 14:00-18:30; Sa: 06:30-14:00; So: Closed; Mo-Fr: 06:30-12:30; Sa: 06:30-12:30; So: Closed'

  INSERT INTO [Core].[Store]
             ([StoreName]
             ,[Canton]
             ,[Streeet]
             ,[PLZ]
             ,[City]
             ,[StoreType]
             ,[WeekKalendar_Id]
             )
   SELECT 'Denner Discount Sulz'
          ,'AG'
          ,'Hauptstrasse 5'
		  ,5085 
		  ,'Sulz'
		  ,'Denner Discount'
		  ,[WeekKalendar_Id]
   FROM [Core].[WeekKalendar]
   WHERE [WeekKalendarName] = 'Mo-Fr: 06:30-12:15, 14:00-18:30; Sa: 06:30-14:00; So: Closed; Mo-Fr: 06:30-12:30; Sa: 06:30-12:30; So: Closed'




DELETE FROM [Core].[PublicHoliday]


INSERT INTO [Core].[PublicHoliday]
           ([PublicHolidayName]
           ,[Area]
           ,[Canton]
           ,[PLZ]
		   ,[Date]                     
           ,[Size]
           ,[DeltaHours])
     VALUES
            ('Neujahr',             'Country', NULL, NULL, CONVERT(DATE, '20220101',112), 'FullDay', NULL)
		   ,('Berchtolds Tag',      'Canton',  'AG', NULL, CONVERT(DATE, '20220102',112), 'FullDay', NULL)
		   ,('Nach Berchtolds Tag', 'Canton',  'AG', NULL, CONVERT(DATE, '20220103',112), 'HalfDay', NULL)
		   ,('Super Tag',           'City',    NULL, 5070, CONVERT(DATE, '20220105',112), 'HalfDay', NULL)
		   

DELETE FROM [Core].[OverwriteBusinessLogic]

INSERT INTO [Core].[OverwriteBusinessLogic]
           ([Store_Id]
           ,[Action]
           ,[Date]
           ,[OpenHours]
           ,[Comment])
     SELECT [Store_Id], 'EnforcedOpening', CONVERT(DATE, '20220101',112), '09:00-11:30, 15:30-17:00', 'Wonderful Day'
	 FROM [Core].[Store]
	 WHERE [StoreName] = 'Denner Discount Frick'
  UNION ALL
     SELECT [Store_Id], 'EnforcedClosing', CONVERT(DATE, '20220104',112), 'Closed', 'Store Cleanup'
	 FROM [Core].[Store]
	 WHERE [StoreName] = 'Denner Satellit Gansingen'
  

END