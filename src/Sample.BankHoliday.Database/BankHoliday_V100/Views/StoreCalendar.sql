



CREATE VIEW [BankHoliday_V100].[StoreCalendar]
AS

  SELECT  [Store_Id]  AS [StoreId]
		 ,[Date]
		 ,[Opening]
		 ,[DayType]  --(WorkingDay, BankHoliday)
		 ,[Reason]
		 ,[Comment]
  FROM [Core].[StoreCalendar]
/*
  SELECT  CONVERT(INT,          1)                            AS [StoreId]
		 ,CONVERT(DATE,         GETDATE())	                  AS [Date]
	 	 ,CONVERT(VARCHAR(50), '08:00-18:00')	              AS [Opening]
		 ,CONVERT(VARCHAR(50), 'WorkingDay')		          AS [DayType]  --(WorkingDay, BankHoliday)
		 ,CONVERT(VARCHAR(50),  NULL)		                  AS [Reason]
		 ,CONVERT(VARCHAR(255), NULL)		                  AS [Comment]

UNION ALL

  SELECT  CONVERT(INT,          1)                            AS [StoreId]
		 ,CONVERT(DATE,        '20220801',112)	              AS [Date]
	 	 ,CONVERT(VARCHAR(50), 'Closed')	                  AS [Opening]
		 ,CONVERT(VARCHAR(50), 'BankHoliday')		          AS [DayType]  --(WorkingDay, BankHoliday)
		 ,CONVERT(VARCHAR(50),  '1.August')		              AS [Reason]
		 ,CONVERT(VARCHAR(255), NULL)		                  AS [Comment]

UNION ALL

  SELECT  CONVERT(INT,          1)                            AS [StoreId]
		 ,CONVERT(DATE,        '20220802',112)	              AS [Date]
	 	 ,CONVERT(VARCHAR(50), 'Closed')	                  AS [Opening]
		 ,CONVERT(VARCHAR(50), 'BankHoliday')		          AS [DayType]  --(WorkingDay, BankHoliday)
		 ,CONVERT(VARCHAR(50), 'EnforcedClosing')             AS [Reason]
		 ,CONVERT(VARCHAR(255),'Hangover')	                  AS [Comment]

UNION ALL

  SELECT  CONVERT(INT,          1)                            AS [StoreId]
		 ,CONVERT(DATE,        '20221224',112)	              AS [Date]
	 	 ,CONVERT(VARCHAR(50), '07:00-22:00')	              AS [Opening]
		 ,CONVERT(VARCHAR(50), 'BankHoliday')		          AS [DayType]  --(WorkingDay, BankHoliday)
		 ,CONVERT(VARCHAR(50), 'EnforcedOpening')             AS [Reason]
		 ,CONVERT(VARCHAR(255),'No need for Christmas')       AS [Comment]
*/