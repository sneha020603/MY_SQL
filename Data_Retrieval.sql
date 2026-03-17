-- ==============================
-- 📂 Data Retrieval
-- ==============================

-- CREATE TABLE + SAMPLE DATA
CREATE TABLE student (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Marks INT,
    City VARCHAR(20)
);

INSERT INTO student VALUES
(1, 'Sneha', 22, 85, 'Delhi'),
(2, 'Pranjali', 21, 78, 'Mumbai'),
(3, 'Alka', 22, 92, 'Delhi'),
(4, 'Dipali', 20, 65, 'Pune'),
(5, 'Neha', 23, 88, 'Mumbai');


-- ==============================
-- SELECT Queries
-- ==============================

SELECT * FROM student;

SELECT Name, Marks FROM student;


-- ==============================
-- WHERE Conditions
-- ==============================

SELECT * FROM student WHERE Marks > 80;

SELECT * FROM student WHERE City = 'Delhi';

SELECT * FROM student WHERE Marks BETWEEN 70 AND 90;

SELECT * FROM student WHERE City IN ('Delhi', 'Mumbai');

SELECT * FROM student WHERE City NOT IN ('Pune');


-- ==============================
-- DISTINCT
-- ==============================

SELECT DISTINCT City FROM student;


-- ==============================
-- ORDER BY
-- ==============================

SELECT * FROM student ORDER BY Marks ASC;

SELECT * FROM student ORDER BY Marks DESC;

SELECT Name FROM student ORDER BY Age DESC;


-- ==============================
-- LIMIT
-- ==============================

SELECT * FROM student LIMIT 3;

SELECT * FROM student ORDER BY Marks DESC LIMIT 2;