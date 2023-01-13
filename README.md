## Video-Game-Sales-Project
This is a Data Analysis and Visualization Project using the Video Game Sales dataset which was provided on Kaggle. 
Link to Kaggle Dataset Page: https://www.kaggle.com/datasets/gregorut/videogamesales
This project was done using Microsoft SQL Server Management Studio and Tableau (Tableau Public)
Link to Tableau Public Dashboards: https://public.tableau.com/app/profile/gabriel.garza7892/viz/VideoGameSalesDashboards/Dashboard2
The "Vizzes" for this project will be named "Video Game Sales Dashboards"

## Methodology 
Data Analysis and Visualization

## Video Game Sales Data Analysis
SELECT *
FROM VGSalesProject..VGSales
ORDER BY Rank

## Checking how many Null values are in the data
SELECT Year
FROM VGSalesProject..VGSales
WHERE Year is NULL

## Removing Null Values from the data set
DELETE FROM VGSalesProject..VGSales
WHERE Year is NULL

DELETE FROM VGSalesProject..VGSales
WHERE Publisher = 'N/A'

## How many games are in each Genre?
SELECT Genre, COUNT(Genre) AS Amount
FROM VGSalesProject..VGSales
GROUP BY Genre
ORDER BY Amount DESC

## Which 5 Years released the most games?
SELECT TOP 5 Year, COUNT(Name) AS Amount
FROM VGSalesProject..VGSales
GROUP BY Year
ORDER BY Amount DESC

## What were the global sales per year? 
SELECT Year, ROUND(SUM(Global_Sales),2) AS Global_Sales
FROM VGSalesProject..VGSales
GROUP BY Year
ORDER BY GLobal_Sales DESC

## What where the total global sales for each Genre?
SELECT Genre, ROUND(SUM(Global_Sales),2) AS Global_Sales
FROM VGSalesProject..VGSales
GROUP BY Genre
ORDER BY Global_Sales DESC

## What was the most sold and produced Genre in what Year?
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

## Game Genre Global Sales throughout time
SELECT Year, Genre, ROUND(SUM(Global_Sales),2) AS Sales
FROM VGSalesProject..VGSales
GROUP BY Year, Genre
ORDER BY Year 

## Which Game Platform peformed the best in Global Sales
SELECT Platform, ROUND(SUM(Global_Sales),2) AS Sales
FROM VGSalesProject..VGSales
GROUP BY Platform
ORDER BY Sales DESC

## What were the 10 best performing video games?
SELECT TOP 10 Name, Year, Genre, Global_Sales
FROM VGSalesProject..VGSales
ORDER BY Global_Sales DESC

## How did Genre Sales differ in each Area?
SELECT Genre, ROUND(SUM(NA_Sales),2) AS North_America, ROUND(SUM(EU_Sales),2) AS Europe, ROUND(SUM(JP_Sales),2) AS Japan, ROUND(SUM(Other_Sales),2) AS Other
FROM VGSalesProject..VGSales
GROUP BY Genre
ORDER BY Genre

## How did Game Platform Sales differ in each area?
SELECT Platform, ROUND(SUM(NA_Sales),2) AS North_America, ROUND(SUM(EU_Sales),2) AS Europe, ROUND(SUM(JP_Sales),2) AS Japan, ROUND(SUM(Other_Sales),2) AS Other
FROM VGSalesProject..VGSales
GROUP BY Platform
ORDER BY Platform

## Top 10 Game Publishers
SELECT Publisher, COUNT(Publisher) AS Published_Games
FROM VGSalesProject..VGSales
GROUP BY Publisher
ORDER BY Published_Games DESC

## Game Publisher Global Sales 
SELECT Publisher, ROUND(SUM(Global_Sales),2) AS Sales
FROM VGSalesProject..VGSales
GROUP BY Publisher
ORDER BY Sales DESC

## Comparing Publisher Area Sales
SELECT Publisher, ROUND(SUM(NA_Sales),2) AS North_America, ROUND(SUM(EU_Sales),2) AS Europe, ROUND(SUM(JP_Sales),2) AS Japan, ROUND(SUM(Other_Sales),2) AS Other
FROM VGSalesProject..VGSales
GROUP BY Publisher
ORDER BY Publisher

## Which Region made the most revenue? 
SELECT ROUND(SUM(NA_Sales),2) AS North_America, ROUND(SUM(EU_Sales),2) AS Europe, ROUND(SUM(JP_Sales),2) AS Japan, ROUND(SUM(Other_Sales),2) AS Other
FROM VGSalesProject..VGSales

## Video Game Sales Data Visualization
![Dashboard 1](https://user-images.githubusercontent.com/120590361/212391896-95740e1f-8107-4266-99a4-26679ccb131c.png)
![Dashboard 2](https://user-images.githubusercontent.com/120590361/212391900-e200d47b-92b3-4509-abc5-6f227e8c53b2.png)
![Dashboard 3](https://user-images.githubusercontent.com/120590361/212391911-3f71ccdc-b511-4def-8ed3-2833499fc43a.png)
