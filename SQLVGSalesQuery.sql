SELECT *
FROM VGSalesProject..VGSales
ORDER BY Rank

--Checking how many Null values are in the data
SELECT Year
FROM VGSalesProject..VGSales
WHERE Year is NULL

--Removing Null Values from the data set
DELETE FROM VGSalesProject..VGSales
WHERE Year is NULL

DELETE FROM VGSalesProject..VGSales
WHERE Publisher = 'N/A'

--How many games are in each Genre?
SELECT Genre, COUNT(Genre) AS Amount
FROM VGSalesProject..VGSales
GROUP BY Genre
ORDER BY Amount DESC

--Which 5 Years released the most games?
SELECT TOP 5 Year, COUNT(Name) AS Amount
FROM VGSalesProject..VGSales
GROUP BY Year
ORDER BY Amount DESC

--What were the global sales per year? 
SELECT Year, ROUND(SUM(Global_Sales),2) AS Global_Sales
FROM VGSalesProject..VGSales
GROUP BY Year
ORDER BY GLobal_Sales DESC

--What where the total global sales for each Genre?
SELECT Genre, ROUND(SUM(Global_Sales),2) AS Global_Sales
FROM VGSalesProject..VGSales
GROUP BY Genre
ORDER BY Global_Sales DESC

--What was the most sold and produced Genre in what Year?
SELECT TOP 1 Year, Genre, Count(Genre) AS Amount,
	(
	SELECT SUM(Global_Sales)
	FROM VGSalesProject..VGSales
	WHERE Year = '2009' AND Genre = 'Action'
	GROUP BY Year, Genre
	) AS Sales
FROM VGSalesProject..VGSales
GROUP BY Year, Genre
ORDER BY Amount DESC

--Game Genre Global Sales throughout time
SELECT Year, Genre, ROUND(SUM(Global_Sales),2) AS Sales
FROM VGSalesProject..VGSales
GROUP BY Year, Genre
ORDER BY Year 

--Which Game Platform peformed the best in Global Sales
SELECT Platform, ROUND(SUM(Global_Sales),2) AS Sales
FROM VGSalesProject..VGSales
GROUP BY Platform
ORDER BY Sales DESC

--What were the 10 best performing video games?
SELECT TOP 10 Name, Year, Genre, Global_Sales
FROM VGSalesProject..VGSales
ORDER BY Global_Sales DESC

--How did Genre Sales differ in each Area?
SELECT Genre, ROUND(SUM(NA_Sales),2) AS North_America, ROUND(SUM(EU_Sales),2) AS Europe, ROUND(SUM(JP_Sales),2) AS Japan, ROUND(SUM(Other_Sales),2) AS Other
FROM VGSalesProject..VGSales
GROUP BY Genre
ORDER BY Genre

--How did Game Platform Sales differ in each area?
SELECT Platform, ROUND(SUM(NA_Sales),2) AS North_America, ROUND(SUM(EU_Sales),2) AS Europe, ROUND(SUM(JP_Sales),2) AS Japan, ROUND(SUM(Other_Sales),2) AS Other
FROM VGSalesProject..VGSales
GROUP BY Platform
ORDER BY Platform

--Top 10 Game Publishers
SELECT Publisher, COUNT(Publisher) AS Published_Games
FROM VGSalesProject..VGSales
GROUP BY Publisher
ORDER BY Published_Games DESC

--Game Publisher Global Sales 
SELECT Publisher, ROUND(SUM(Global_Sales),2) AS Sales
FROM VGSalesProject..VGSales
GROUP BY Publisher
ORDER BY Sales DESC

--Comparing Publisher Area Sales
SELECT Publisher, ROUND(SUM(NA_Sales),2) AS North_America, ROUND(SUM(EU_Sales),2) AS Europe, ROUND(SUM(JP_Sales),2) AS Japan, ROUND(SUM(Other_Sales),2) AS Other
FROM VGSalesProject..VGSales
GROUP BY Publisher
ORDER BY Publisher

--Which Region made the most revenue? 
SELECT ROUND(SUM(NA_Sales),2) AS North_America, ROUND(SUM(EU_Sales),2) AS Europe, ROUND(SUM(JP_Sales),2) AS Japan, ROUND(SUM(Other_Sales),2) AS Other
FROM VGSalesProject..VGSales
