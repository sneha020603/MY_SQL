-- ==============================
-- 📂 Aggregate Functions
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
(5, 'Neha', 88, 'Mumbai');


-- ==============================
-- COUNT()
-- ==============================

-- Total number of students
SELECT COUNT(*) FROM student;

-- Count students from Delhi
SELECT COUNT(Name)
FROM student
WHERE City = 'Delhi';


-- ==============================
-- SUM()
-- ==============================

-- Total marks of all students
SELECT SUM(Marks) FROM student;


-- ==============================
-- AVG()
-- ==============================

-- Average marks
SELECT AVG(Marks) FROM student;


-- ==============================
-- MAX()
-- ==============================

-- Highest marks
SELECT MAX(Marks) FROM student;


-- ==============================
-- MIN()
-- ==============================

-- Lowest marks
SELECT MIN(Marks) FROM student;