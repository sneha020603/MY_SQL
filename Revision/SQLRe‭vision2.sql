USE `awesome chocolates`;

SELECT * FROM sales;
SELECT * FROM people;

SELECT s.SaleDate, s.Amount, p.Salesperson, p.SPID, s.SPID
FROM sales s JOIN people p
ON s.SPID = p.SPID;

SELECT s.SaleDate, s.Amount, pr.Product
FROM sales s LEFT JOIN products pr
ON s.PID = pr.PID;

-- multi joins
SELECT s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
FROM  sales s
JOIN people p ON p.SPID = s.SPID
JOIN products pr ON pr.PID = s.PID;

--- condition in joins
SELECT s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
FROM  sales s
JOIN people p ON p.SPID = s.SPID
JOIN products pr ON pr.PID = s.PID
WHERE s.Amount > 1000
AND p.Team IN ('Delish','Yummies');

SELECT s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
FROM  sales s
JOIN people p ON p.SPID = s.SPID
JOIN products pr ON pr.PID = s.PID
WHERE s.Amount > 1000
AND p.Team ='';

SELECT s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team, g.Geo
FROM  sales s
JOIN people p ON p.SPID = s.SPID
JOIN products pr ON pr.PID = s.PID
JOIN geo g ON g.GeoID = s.GeoID
WHERE s.Amount > 100
AND p.Team IN ('Delish','Yummies')
AND g.Geo IN('New Zealand','India')
ORDER BY s.SaleDate;

-- group by
SELECT geoID, SUM(Amount) as Total
FROM sales 
GROUP BY geoID;

SELECT g.Geo, SUM(Amount) AS Total, AVG(amount) AS AvgAmount, sum(Boxes) AS SumOfBoxes
FROM sales s
JOIN geo g ON g.GeoID = s.GeoID
GROUP BY g.Geo
Order By g.Geo;

SELECT pr.Category, p.Team, 
       SUM(Amount) AS Total, 
       SUM(Boxes) AS SumOfBoxes
FROM sales s
JOIN people p ON p.SPID = s.SPID
JOIN products pr ON pr.PID = s.PID
GROUP BY pr.Category, p.Team;

SELECT pr.Category, p.Team, SUM(Amount) AS Total, sum(Boxes) AS SumOfBoxes
FROM sales s
JOIN people p ON p.SPID = s.SPID
JOIN products pr ON pr.PID = s.PID
GROUP BY pr.Category, p.Team	
Order By pr.Category, p.Team;

SELECT p.Product, SUM(s.Amount) AS TotalAmount
FROM sales s
JOIN products p ON p.PID = s.PID
GROUP BY p.Product
ORDER BY TotalAmount DESC
LIMIT 10;