
CREATE VIEW [Core].[StoreCalendarWithPublicHoliday]
AS

SELECT  
        [StoreCalendarStart].[Date]
	   ,[StoreCalendarStart].[Store_Id]
	   ,[StoreCalendarStart].[StoreName]
	   ,[StoreCalendarStart].[Canton]
	   ,[StoreCalendarStart].[Streeet]
	   ,[StoreCalendarStart].[PLZ]
	   ,[StoreCalendarStart].[City]
       ,CASE WHEN COALESCE([CityLevel].[Size]
	                    , [CantonLevel].[Size]
						, [CountryLevel].[Size]) = 'FullDay' THEN 'Closed'
	        WHEN COALESCE([CityLevel].[Size]
			            , [CantonLevel].[Size]
						, [CountryLevel].[Size]) = 'HalfDay' THEN [StoreCalendarStart].[HalfDayPattern]

	                                                 ELSE [StoreCalendarStart].[FullDayPattern]
													 END 
	    AS [PublicHolidayOpening]
	   ,[StoreCalendarStart].[FullDayPattern]
	   ,[StoreCalendarStart].[HalfDayPattern]
	   ,COALESCE([CityLevel].[PublicHolidayName]
	            ,[CantonLevel].[PublicHolidayName] 
				,[CountryLevel].[PublicHolidayName]) AS PublicHolidayName
FROM  [Core].[StoreCalendarStart]
  LEFT OUTER JOIN [Core].[PublicHoliday] AS [CountryLevel]
    ON  [StoreCalendarStart].[Date] =  [CountryLevel].[Date]
	AND [CountryLevel].Area  = 'Country'
  LEFT OUTER JOIN [Core].[PublicHoliday] AS [CantonLevel]
    ON  [StoreCalendarStart].[Date] =  [CantonLevel].[Date]
	AND [StoreCalendarStart].[Canton] =  [CantonLevel].[Canton]
	AND [CantonLevel].Area  = 'Canton'
  LEFT OUTER JOIN [Core].[PublicHoliday] AS [CityLevel]
    ON  [StoreCalendarStart].[Date] =  [CityLevel].[Date]
	AND [StoreCalendarStart].[PLZ] =  [CityLevel].[PLZ]
	AND [CityLevel].Area  = 'City'
--ORDER BY Store_Id, [StoreCalendarStart].[Date]