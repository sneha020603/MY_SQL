-- ==============================
-- 📂 GROUP BY + HAVING
-- ==============================

-- CREATE TABLE + SAMPLE DATA
CREATE TABLE student (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    City VARCHAR(20)
);

INSERT INTO student VALUES
(1, 'Sneha', 85, 'Delhi'),
(2, 'Pranjali', 78, 'Mumbai'),
(3, 'Alka', 92, 'Delhi'),
(4, 'Dipali', 65, 'Pune'),
(5, 'Neha', 88, 'Mumbai'),
(6, 'Riya', 95, 'Delhi');


-- ==============================
-- GROUP BY
-- ==============================

-- Average marks per city
SELECT City, AVG(Marks)
FROM student
GROUP BY City;

-- Count students per city
SELECT City, COUNT(*)
FROM student
GROUP BY City;


-- ==============================
-- HAVING
-- ==============================

-- Cities where average marks > 80
SELECT City, AVG(Marks)
FROM student
GROUP BY City
HAVING AVG(Marks) > 80;

-- Cities having more than 1 student
SELECT City, COUNT(*)
FROM student
GROUP BY City
HAVING COUNT(*) > 1;


-- ==============================
-- GROUP BY + HAVING + WHERE
-- ==============================

-- Cities with students scoring >70 and avg >80
SELECT City, AVG(Marks)
FROM student
WHERE Marks > 70
GROUP BY City
HAVING AVG(Marks) > 80;


-- ==============================
-- ORDER BY with GROUP BY
-- ==============================

SELECT City, AVG(Marks) AS avg_marks
FROM student
GROUP BY City
HAVING avg_marks > 75
ORDER BY avg_marks DESC;