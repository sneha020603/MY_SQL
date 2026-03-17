CREATE DATABASE company_XYZ;

USE company_XYZ;

CREATE TABLE employee_info(
ID INT PRIMARY KEY,
Name VARCHAR(50),
Salary INT NOT NULL
);

INSERT INTO employee_info(ID,Name,Salary)
VALUES 
(1,'Adam',25000),
(2,'Bob',30000),
(3,'Casey',40000);

INSERT INTO employee_info VALUES (4,'shukla',40000);
INSERT INTO employee_info VALUES (5,'Sneha',55000);

SHOW databases;
SHOW tables;

SELECT*FROM employee_info;

CREATE TABLE emp_Data (
empID INT PRIMARY KEY,
name VARCHAR(50),
salary INT NOT NULL,
city VARCHAR(20)
) ;

INSERT INTO emp_Data
(empID, name, salary,  city)
VALUES
(101, "anil", 78000, "Pune"),
(103, "chetan", 85000, "Mumbai"),
(104, "dhruv", 96000,"Delhi"),
(105, "emanuel", 12000, "Delhi"),
(106, "bhumika", 63000, "Mumbai"),
(107, "farah", 82000,  "Delhi");

SELECT city, AVG(salary)
FROM emp_Data
GROUP BY CITY
ORDER BY CITY ASC;

CREATE TABLE Student_Data (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city varchar(50)
) ;

DROP TABLE Student_Data;

INSERT INTO Student_Data
(rollno, name, marks, grade, city)
VALUES
(119, "bhumika", 63, "D", "Mumbai"),
(101, "anil", 78, "C", "Pune"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

SELECT*FROM Student_Data;

ALTER TABLE Student_Data
CHANGE name Full_name varchar(50);

DELETE FROM Student_Data
WHERE marks<80;

ALTER TABLE Student_Data
DROP COLUMN grade;
