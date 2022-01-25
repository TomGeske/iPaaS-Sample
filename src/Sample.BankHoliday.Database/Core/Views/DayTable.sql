
CREATE VIEW		[Core].[DayTable]
AS


   WITH IdList
   AS
   (
     SELECT TOP 30000 A.object_id
     FROM SYS.objects a
       cross join SYS.objects b
       cross join SYS.objects c
   )
   , RowNumber
   AS
   (
     SELECT ROW_NUMBER() over (order by object_id) -1 AS Id
     FROM IdList
   )
   , DayList
   AS
   (
     SELECT DATEADD(DAY, Id ,CONVERT(DATE,'20210101',112)) TheDay
     FROM RowNumber
   )
   SELECT TheDay                    AS [Date]
         ,DATEPART(WEEKDAY, TheDay) AS [WeekDay]
   FROM DayList
   WHERE DATEPART(YEAR, TheDay) = DATEPART(YEAR,GETDATE())