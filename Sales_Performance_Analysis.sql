CREATE DATABASE SalesPerformanceDB;

USE SalesPerformanceDB;

Show Databases;

SELECT  * FROM sales_performance_record;

-- 1) Retrieve all sales records for the first half of the year (January – June):
SELECT *
FROM sales_performance_record
WHERE Month IN ('January','February','March','April','May','June');

-- 2) Total revenue generated for each month:
SELECT Month, SUM(Revenue) AS Total_Revenue
FROM sales_performance_record
GROUP BY Month
ORDER BY Total_Revenue DESC;

-- 3) Total Units sold for each Products
SELECT Product, SUM(`Units Sold`) AS Total_Units
FROM sales_performance_record
GROUP BY Product
ORDER BY Total_Units DESC;

-- 4) Product with the Highest Total Revenue:
SELECT Product, SUM(Revenue) AS Total_Revenue
FROM sales_performance_record
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 1;

-- 5) Region with the Lowest Sales Revenue in the first Half of the Year:
SELECT Region, SUM(Revenue) AS Total_Revenue
FROM sales_performance_record
GROUP BY Region
ORDER BY Total_Revenue ASC
LIMIT 1;

-- 6) Average Monthly Revenue for each Region:
SELECT Region, AVG(Revenue) AS Average_Monthly_Revenue
FROM sales_performance_record
GROUP BY Region
ORDER BY Average_Monthly_Revenue Desc;

-- 7) Top 3 Products with the Highest Total Sales Revenue across all Regions:
SELECT Product, SUM(Revenue) AS Total_Revenue
FROM sales_performance_record
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 3;

-- 8) Products with Revenue greater than (>) N500.00:
SELECT *
FROM sales_performance_record
WHERE Revenue > 500;

-- 9) Top 5 Highest Revenue Transactions:
SELECT *
FROM sales_performance_record
ORDER BY Revenue DESC
LIMIT 5;

-- 10) Total Revenue and Total Units Sold Per Region:
SELECT Region,
       SUM(Revenue) AS Total_Revenue,
       SUM(`Units Sold`) AS Total_Units
FROM sales_performance_record
GROUP BY Region
ORDER BY Total_Revenue DESC;

-- 11) Average Revenue per Unit Sold for each Product:
SELECT Product,
       SUM(Revenue) / SUM('Units_Sold') AS Avg_Revenue_Per_Unit
FROM sales_performance_record
GROUP BY Product;


-- SUMMARY OF KEY INSIGHTS/FINDINGS FROM SALES PERFORMANCE ANALYSIS:
--	A) Total company revenue for Jan–June shows strong contribution from Kilishi product with a Total Revenue of 12819.17
--	B) The highest performing region is Abuja recording a Total_Revenue of 14614.31
--	C) The lowest revenue region is Lagos with a revenue generation of 11792.60
--	D) The product generating highest revenue is Kilishi
--	E) Top 3 revenue generating products are:
--	(i) Kilishi = 12819.17 revenue income
--	(ii) Zobo Drink = 10977.41 revenue income
--	(iii) Popcorn = 10204.00 revenue income
--	F) Average revenue per unit shows that Kilishi has higher profit efficiency

