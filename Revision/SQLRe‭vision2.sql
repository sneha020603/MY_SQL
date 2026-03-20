-- Q1: Use chocolates database and view base tables
-- Theory: Always check raw data before applying joins
USE `awesome chocolates`;
SELECT * FROM sales;
SELECT * FROM people;

-- Q2: Join sales with people using SPID
-- Theory: INNER JOIN returns only matching records from both tables
SELECT s.SaleDate, s.Amount, p.Salesperson, p.SPID, s.SPID
FROM sales s 
JOIN people p ON s.SPID = p.SPID;

-- Q3: Get product name for each sale (LEFT JOIN)
-- Theory: LEFT JOIN keeps all records from left table even if no match
SELECT s.SaleDate, s.Amount, pr.Product
FROM sales s 
LEFT JOIN products pr ON s.PID = pr.PID;

-- Q4: Combine sales, people, and products (multi join)
-- Theory: Multiple JOINs combine data from multiple tables
SELECT s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
FROM sales s
JOIN people p ON p.SPID = s.SPID
JOIN products pr ON pr.PID = s.PID;

-- Q5: Filter joined data (amount > 1000 and specific teams)
-- Theory: WHERE filters data after JOIN
SELECT s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
FROM sales s
JOIN people p ON p.SPID = s.SPID
JOIN products pr ON pr.PID = s.PID
WHERE s.Amount > 1000
AND p.Team IN ('Delish','Yummies');

-- Q6: Check for empty team values
-- Theory: '' means empty string, not NULL
SELECT s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
FROM sales s
JOIN people p ON p.SPID = s.SPID
JOIN products pr ON pr.PID = s.PID
WHERE s.Amount > 1000
AND p.Team = '';

-- Q7: Add geo info with filters and sorting
-- Theory: More JOINs + WHERE + ORDER BY = filtered and sorted result
SELECT s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team, g.Geo
FROM sales s
JOIN people p ON p.SPID = s.SPID
JOIN products pr ON pr.PID = s.PID
JOIN geo g ON g.GeoID = s.GeoID
WHERE s.Amount > 100
AND p.Team IN ('Delish','Yummies')
AND g.Geo IN ('New Zealand','India')
ORDER BY s.SaleDate;

-- Q8: Total sales amount by GeoID
-- Theory: GROUP BY groups data, SUM calculates total
SELECT GeoID, SUM(Amount) AS Total
FROM sales 
GROUP BY GeoID;

-- Q9: Total, average, and boxes by Geo
-- Theory: Aggregate functions = SUM, AVG for calculations
SELECT g.Geo, SUM(Amount) AS Total, AVG(Amount) AS AvgAmount, SUM(Boxes) AS SumOfBoxes
FROM sales s
JOIN geo g ON g.GeoID = s.GeoID
GROUP BY g.Geo
ORDER BY g.Geo;

-- Q10: Sales summary by category and team
-- Theory: GROUP BY multiple columns groups combination data
SELECT pr.Category, p.Team, 
       SUM(Amount) AS Total, 
       SUM(Boxes) AS SumOfBoxes
FROM sales s
JOIN people p ON p.SPID = s.SPID
JOIN products pr ON pr.PID = s.PID
GROUP BY pr.Category, p.Team;

-- Q11: Same as above but sorted
-- Theory: ORDER BY sorts grouped results
SELECT pr.Category, p.Team, SUM(Amount) AS Total, SUM(Boxes) AS SumOfBoxes
FROM sales s
JOIN people p ON p.SPID = s.SPID
JOIN products pr ON pr.PID = s.PID
GROUP BY pr.Category, p.Team
ORDER BY pr.Category, p.Team;

-- Q12: Top 10 products by total sales
-- Theory: LIMIT restricts number of rows (top results)
SELECT p.Product, SUM(s.Amount) AS TotalAmount
FROM sales s
JOIN products p ON p.PID = s.PID
GROUP BY p.Product
ORDER BY TotalAmount DESC
LIMIT 10;