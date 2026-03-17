-- ==============================
-- 📂 JOINS
-- ==============================

-- CREATE TABLES
CREATE TABLE student (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE course (
    ID INT PRIMARY KEY,
    Course_Name VARCHAR(50)
);

-- INSERT DATA
INSERT INTO student VALUES
(1, 'Sneha'),
(2, 'Pranjali'),
(3, 'Alka'),
(4, 'Dipali');

INSERT INTO course VALUES
(1, 'CSE'),
(2, 'IT'),
(4, 'ECE'),
(5, 'ME');


-- ==============================
-- INNER JOIN
-- ==============================

-- Only matching records
SELECT *
FROM student
INNER JOIN course
ON student.ID = course.ID;


-- ==============================
-- LEFT JOIN
-- ==============================

-- All students + matching course
SELECT *
FROM student
LEFT JOIN course
ON student.ID = course.ID;


-- ==============================
-- RIGHT JOIN
-- ==============================

-- All courses + matching students
SELECT *
FROM course
RIGHT JOIN student
ON course.ID = student.ID;


-- ==============================
-- FULL JOIN (using UNION)
-- ==============================

SELECT *
FROM student
LEFT JOIN course
ON student.ID = course.ID
UNION
SELECT *
FROM student
RIGHT JOIN course
ON student.ID = course.ID;


-- ==============================
-- LEFT EXCLUSIVE JOIN
-- ==============================

-- Students without course
SELECT *
FROM student
LEFT JOIN course
ON student.ID = course.ID
WHERE course.ID IS NULL;


-- ==============================
-- RIGHT EXCLUSIVE JOIN
-- ==============================

-- Courses without students
SELECT *
FROM course
LEFT JOIN student
ON course.ID = student.ID
WHERE student.ID IS NULL;