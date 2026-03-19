-- Q1: Create a database if it doesn't already exist and start using it
CREATE DATABASE IF NOT EXISTS inrevision;
USE inrevision;


-- Q2: Switch to the chocolates dataset database and view all tables
USE `awesome chocolates`;
SHOW TABLES;


-- Q3: See structure of the sales table (columns + data types)
DESC sales;

-- Q4: View all data from sales table
SELECT * FROM sales;


-- Q5: Show sale date, amount, and customers
SELECT SaleDate, Amount, Customers FROM sales;

-- Q6: Show amount, number of boxes, and GeoID
SELECT Amount, Boxes, GeoID FROM sales;


-- Q7: Calculate amount per box (basic alias)
SELECT SaleDate, Amount, Boxes, Amount / Boxes AS Amount_per_Box FROM sales;

-- Q8: Calculate amount per box with readable column name
SELECT SaleDate, Amount, Boxes, Amount / Boxes AS `Amount per Box` FROM sales;

-- Q9: Another way to give alias (without AS keyword)
SELECT SaleDate, Amount, Boxes, Amount / Boxes 'Amount per Box' FROM sales;


-- Q10: Show records where amount is greater than 10000
SELECT SaleDate, Amount, Boxes, Amount / Boxes AS `Amount per Box` 
FROM sales
WHERE Amount > 10000;


-- Q11: Get high sales and sort by SPID (limit results)
SELECT * FROM sales
WHERE Amount > 10000
ORDER BY SPID 
LIMIT 100;


-- Q12: Get high sales sorted by highest amount first
SELECT * FROM sales
WHERE Amount > 10000
ORDER BY Amount DESC  
LIMIT 100;


-- Q13: Filter by GeoID and sort by product and amount
SELECT * FROM sales
WHERE GeoID = 'g1'
ORDER BY PID, Amount DESC;


-- Q14: Sales above 10000 after a specific date
SELECT * FROM sales
WHERE Amount > 10000 AND SaleDate >= '2022-01-01';


-- Q15: Sales in 2022 with amount > 10000 sorted by highest amount
SELECT SaleDate, Amount FROM sales
WHERE Amount > 10000 AND YEAR(SaleDate) = 2022
ORDER BY Amount DESC;


-- Q16: Find sales where boxes are between 0 and 50 (with sorting by date)
SELECT SaleDate, Amount, Boxes FROM sales
WHERE Boxes BETWEEN 0 AND 50
ORDER BY SaleDate;


-- Q17: Find sales where boxes are between 0 and 50 (sorted by boxes)
SELECT * FROM sales
WHERE Boxes> 0 AND Boxes <=50
ORDER BY Boxes;

-- weekday()
-- Q18: Find sales that happened on a specific weekday (Friday = 4)
SELECT SaleDate, Amount, WEEKDAY(SaleDate) AS 'Day Of Week' 
FROM sales
WHERE WEEKDAY(SaleDate) = 4;


-- Q19: Same as above but using subquery (filter after creating temp result)
SELECT *
FROM (
    SELECT SaleDate, Amount, WEEKDAY(SaleDate) AS 'Day Of Week'
    FROM sales
) AS temp
WHERE `Day Of Week` = 4;


-- Q20: View all data from people table
SELECT * FROM people;


-- Q21: Find people from specific teams using OR condition
SELECT * FROM people
WHERE Team = 'Delish' OR Team = 'Jucies';


-- Q22: Find people from specific teams using IN (cleaner way)
SELECT * FROM people
WHERE Team IN ('Delish', 'Jucies');


-- Q23: Find salespersons whose name starts with 'B'
SELECT * FROM people
WHERE Salesperson LIKE 'B%';


-- Q24: Find salespersons whose name contains 'B' anywhere
SELECT * FROM people
WHERE Salesperson LIKE '%B%';


-- Q25: Categorize sales amount into groups using CASE
SELECT SaleDate, Amount,
       CASE 
           WHEN Amount < 1000 THEN 'Under 1k'
           WHEN Amount < 5000 THEN 'Under 5k'
           WHEN Amount < 10000 THEN 'Under 10k'
           ELSE '10k or More'
       END AS 'Amount Category'
FROM sales;