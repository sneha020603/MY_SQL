
-- ==============================
-- 📂 DATABASE OPERATIONS
-- ==============================

CREATE DATABASE IF NOT EXISTS collage;
DROP DATABASE IF EXISTS temp1;

CREATE DATABASE IF NOT EXISTS company_XYZ;
CREATE DATABASE IF NOT EXISTS COLLAGE_LNCT;

SHOW DATABASES;


-- ==============================
-- 📂 USE DATABASE
-- ==============================

USE collage;


-- ==============================
-- 📂 TABLE: STUDENT
-- ==============================

CREATE TABLE student(
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    AGE INT NOT NULL
);

INSERT INTO student VALUES
(1,'Sneha',22),
(2,'Pranjali Shukla',22),
(4,'Alka Mishra',21),
(5,'Dipali',21);

SELECT * FROM student;


-- ==============================
-- 📂 TABLE: CLASS_A
-- ==============================

CREATE TABLE class_A (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT NOT NULL
);

INSERT INTO class_A VALUES
(101,'KHUSHI',24),
(102,'PRANJU',22),
(103,'PRIYANSIH',24),
(104,'NEHA',22),
(105,'SNEHA',22);

SELECT * FROM class_A;


-- ==============================
-- 📂 CONSTRAINTS (EMPLOYEE DATA)
-- ==============================

USE company_XYZ;

CREATE TABLE employee_data(
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT DEFAULT 25000
);

INSERT INTO employee_data VALUES
(1,'Adam',25000),
(2,'Bob',30000),
(3,'Shukla',40000),
(4,'Sneha',55000);

INSERT INTO employee_data(ID,Name) VALUES (6,'Shahil');

SELECT * FROM employee_data;

-- ==============================
-- 📂 SHOW and DROP
-- ==============================
	SHOW databases;
    DROP table employee_data;
    
    