-- CREATE database temp1;
-- SHOW DATABASES;
-- create database temp2;
-- DROP DATABASE temp2;

CREATE DATABASE collage;

DROP DATABASE temp1;

USE collage;

CREATE TABLE student(
ID INT PRIMARY KEY ,
Name VARCHAR(50),
AGE INT NOT NULL
);

INSERT INTO student VALUES(1,"Sneha",22);
INSERT INTO student VALUES(2,"Pranjali Shukla",22);

INSERT INTO student VALUES(4,"Alka mishra",21);
INSERT INTO student VALUES(5,"Dipali",21);
 
 SELECT*FROM student;
 
 -- DATABASE RELATED QERIES:-
 CREATE DATABASE child;
 CREATE DATABASE IF NOT EXISTS child;
 
 DROP DATABASE child;
 DROP DATABASE IF EXISTS child;
 
 SHOW DATABASES;
 SHOW TABLES;
 
 -- TABLE RELATED QERIES:-
 CREATE TABLE class_A (
 RollNo INT PRIMARY KEY,
 Name VARCHAR(50) ,
 Age INT NOT NULL
 );
USE collage;
DROP TABLE IF EXISTS classsa;
 
 SELECT*FROM class_A;
 
--  INSERT INTO class_A(RollNO,Name,Age)
--  VALUES
--  (101,KHUSHI,24),
--  (102,PRANJU,22),
--  (103,PRIYANSIH,24),
--  (104,NEHA,22);
 
 CREATE TABLE class_A (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT NOT NULL
);

INSERT INTO class_A (RollNo, Name, Age)
VALUES
(101, 'KHUSHI', 24),
(102, 'PRANJU', 22),
(103, 'PRIYANSIH', 24),
(104, 'NEHA', 22);

 
 INSERT INTO class_A VALUES(105,'SNEHA',22); 
 
 -- constraints
 USE company_XYZ;
 
 CREATE TABLE employee_data(
ID INT PRIMARY KEY,
Name VARCHAR(50),
Salary INT DEFAULT 25000
);
INSERT INTO employee_data(ID,Name,Salary)
VALUES 
(1,'Adam',25000),
(2,'Bob',30000);
INSERT INTO employee_data VALUES (3,'shukla',40000);
INSERT INTO employee_data VALUES (4,'Sneha',55000);
INSERT INTO employee_data(ID,Name) VALUES (6,'Shahil');

 SELECT*FROM employee_data;

 CREATE TABLE IF NOT EXISTS company_data(
 Department_ID INT ,
 Dept_Name VARCHAR(20),
 NO_Employee INT NOT NULL,
 constraint NO_Employee check(NO_Employee >50),
 HEAD_DEP INT,
 FOREIGN KEY(HEAD_DEP) REFERENCES employee_data(ID),
 PRIMARY KEY(Department_ID,HEAD_DEP)
 );
 
 INSERT INTO company_data( Department_ID ,Dept_Name,NO_Employee, HEAD_DEP)
VALUES 
(101,'devep',250,1),
(102,'sale',56,2);
INSERT INTO company_data( Department_ID ,Dept_Name,NO_Employee, HEAD_DEP) VALUES (103,'hr',240,2);
INSERT INTO company_data( Department_ID ,Dept_Name,NO_Employee, HEAD_DEP) VALUES (104,'s/w',550,3);
INSERT INTO company_data( Department_ID ,Dept_Name,NO_Employee, HEAD_DEP) VALUES (105,'h/w',70,3);
  SELECT*FROM company_data;