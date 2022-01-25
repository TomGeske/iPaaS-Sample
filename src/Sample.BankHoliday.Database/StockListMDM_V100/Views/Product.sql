
CREATE VIEW [StockListMDM_V100].[Product]
AS


          SELECT CONVERT(INT, 1) AS ProductId, CONVERT(VARCHAR(50), 'Denner Lammfilet') AS ProductName, CONVERT(VARCHAR(50), 'Fleisch') AS Category, CONVERT(FLOAT, 5.39) AS ListPrice
UNION ALL SELECT CONVERT(INT, 2) AS ProductId, CONVERT(VARCHAR(50), 'Clementinen')      AS ProductName, CONVERT(VARCHAR(50), 'Früchte') AS Category, CONVERT(FLOAT, 3.00)    AS ListPrice
UNION ALL SELECT CONVERT(INT, 3) AS ProductId, CONVERT(VARCHAR(50), 'Cocobohnen')       AS ProductName, CONVERT(VARCHAR(50), 'Gemüse') AS Category,  CONVERT(FLOAT, 2.55)    AS ListPrice
UNION ALL SELECT CONVERT(INT, 4) AS ProductId, CONVERT(VARCHAR(50), 'Fenchel')          AS ProductName, CONVERT(VARCHAR(50), 'Gemüse') AS Category,  CONVERT(FLOAT, 1.35)    AS ListPrice