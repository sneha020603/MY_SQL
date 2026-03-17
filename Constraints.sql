-- ==============================
-- 📂 Constraints 
-- ==============================

CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;


-- ==============================
-- PRIMARY KEY
-- ==============================

CREATE TABLE student (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);


-- ==============================
-- NOT NULL
-- ==============================

CREATE TABLE user_data (
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL
);


-- ==============================
-- UNIQUE
-- ==============================

CREATE TABLE users (
    ID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE
);


-- ==============================
-- DEFAULT
-- ==============================

CREATE TABLE emp_salary (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT DEFAULT 25000
);

INSERT INTO emp_salary (ID, Name)
VALUES (1, 'Sneha');  -- Salary auto = 25000


-- ==============================
-- CHECK
-- ==============================

CREATE TABLE employee_check (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    CHECK (Age >= 18)
);


-- ==============================
-- FOREIGN KEY
-- ==============================

CREATE TABLE department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50)
);

CREATE TABLE employee (
    Emp_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES department(Dept_ID)
);


-- ==============================
-- COMPOSITE PRIMARY KEY
-- ==============================

CREATE TABLE project (
    Emp_ID INT,
    Project_ID INT,
    PRIMARY KEY (Emp_ID, Project_ID)
);


-- ==============================
-- FOREIGN KEY with CASCADE
-- ==============================

CREATE TABLE parent (
    ID INT PRIMARY KEY
);

CREATE TABLE child (
    ID INT PRIMARY KEY,
    Parent_ID INT,
    FOREIGN KEY (Parent_ID)
    REFERENCES parent(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- ==============================
-- INSERT SAMPLE DATA
-- ==============================

INSERT INTO department VALUES (101, 'CSE');
INSERT INTO employee VALUES (1, 'Sneha', 101);