show databases;
use `awesome chocolates`;

-- 1. Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?
SELECT * FROM sales
WHERE Amount > 2000 AND Boxes <100;

-- 2. How many shipments (sales) each of the sales persons had in the month of January 2022?
SELECT  p.Salesperson, COUNT(s.SPID) AS TotalShipments
FROM sales s
JOIN people p ON p.SPID = s.SPID
WHERE s.SaleDate BETWEEN '2022-01-01' AND '2022-01-31'
GROUP BY p.Salesperson
order by p.Salesperson;

-- 3. Which product sells more boxes? Milk Bars or Eclairs?
SELECT pr.Product, SUM(s.Boxes) AS Total_Boxes
FROM sales s
JOIN products pr ON pr.PID = s.PID
WHERE pr.Product IN ('Milk Bars', 'Eclairs')
GROUP BY pr.Product
ORDER BY Total_Boxes DESC
Limit 1;

-- 4. Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?
SELECT pr.Product, SUM(s.Boxes) AS Total_Boxes
FROM sales s
JOIN products pr ON pr.PID = s.PID
WHERE s.SaleDate >= '2022-02-01' AND s.SaleDate < '2022-02-08'
AND pr.Product IN ('Milk Bars', 'Eclairs')
GROUP BY pr.Product
ORDER BY Total_Boxes DESC
LIMIT 1;


