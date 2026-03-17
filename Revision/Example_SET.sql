CREATE DATABASE COLLAGE_LNCT;
USE COLLAGE_LNCT;

CREATE TABLE Student_Data (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
) ;

-- Insert this data
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
-- 101	anil	78	C	Pune
-- 102	bhumika	93	A	Mumbai
-- 103	chetan	85	B	Mumbai
-- 104	dhruv	96	A	Delhi
-- 105	emanuel	12	F	Delhi

ALTER TABLE Student_Data
ADD COLUMN age INT NOT NULL DEFAULT 19;
-- 101	anil	78	C	Pune	19
-- 102	bhumika	93	A	Mumbai	19
-- 103	chetan	85	B	Mumbai	19
-- 104	dhruv	96	A	Delhi	19
-- 105	emanuel	12	F	Delhi	19
ALTER TABLE Student_Data
ADD COLUMN ST_age INT NOT NULL DEFAULT 00;

ALTER TABLE Student_Data
DROP COLUMN ST_age;

ALTER TABLE Student_Data
MODIFY age VARCHAR(2);

ALTER TABLE Student_Data
CHANGE age AGE INT NOT NULL;

ALTER TABLE Student_Data
RENAME TO ST_data;
SELECT*FROM ST_data;
 
SELECT name,marks FROM Student_Data;

SELECT DISTINCT city FROM Student_Data;
 
SELECT*FROM Student_Data WHERE marks>=75;
SELECT*FROM Student_Data WHERE grade='A' ;
SELECT name,city FROM Student_Data WHERE marks +10 > 100 ;

SELECT*FROM Student_Data WHERE marks>70 AND city='Delhi';
SELECT name,grade FROM Student_Data WHERE marks>75 OR city='Pune';
SELECT*FROM Student_Data WHERE marks BETWEEN 80 AND 100;
SELECT name FROM Student_Data WHERE city IN('Delhi','Mumbai');
SELECT*FROM Student_Data WHERE city NOT IN('Delhi');

SELECT*FROM Student_Data LIMIT 4;

SELECT name FROM Student_Data ORDER BY marks desc;
SELECT name FROM Student_Data ORDER BY marks desc LIMIT 3;
SELECT name FROM Student_Data ORDER BY city desc ;

SELECT MAX(marks) FROM Student_Data;
SELECT COUNT(name) FROM Student_Data;
SELECT MIN(marks) FROM Student_Data;
SELECT SUM(marks) FROM Student_Data;

SELECT city, AVG(marks) 
FROM Student_Data GROUP BY CITY;
SELECT city, COUNT(name) 
FROM Student_Data GROUP BY CITY;

SELECT grade, COUNT(name)
FROM Student_Data
GROUP BY grade
ORDER BY grade ;

SELECT COUNT(name), city
FROM Student_Data
Group by city
HAVING max(marks) >= 90;

SELECT name, city
FROM Student_Data
WHERE grade ="A"
GROUP BY name,city
HAVING MAX(marks) >80
ORDER BY name;

CREATE TABLE Dep_Data (
ID INT PRIMARY KEY,
name VARCHAR(50)
) ;

CREATE TABLE Teacher_Data (
ID INT PRIMARY KEY,
name VARCHAR(50),
Dept_ID INT NOT NULL,
FOREIGN KEY (Dept_ID)
REFERENCES Dep_Data(ID)
ON DELETE CASCADE
ON UPDATE CASCADE 
) ;
DROP TABLE Teacher_Data;

INSERT INTO Teacher_Data
(ID, name, Dept_ID)
VALUES
(201, "RAM ", 101),
(202,"SITA",103),
(203,"KRISNA",104),
(204,"RADHA",107);

INSERT INTO Dep_Data
(ID, name)
VALUES
(101, "IOT"),
(103, "AIML"),
(104, "AIDS"),
(105, "EC"),
(106, "CSE"),
(107, "ECE");

SELECT*FROM Dep_Data;
SELECT*FROM Teacher_Data;

SET SQL_SAFE_UPDATES =0;

UPDATE Dep_Data
SET ID=001
WHERE ID="107";

CREATE table st(
ID INT PRIMARY KEY,
Name VARCHAR(50),
Age INT DEFAULT 19
);

INSERT INTO st
(ID,Name,Age)
VALUES
(102,"sneha",22),
(101,"pranjali",22),
(103,"alka",22),
(104,"depali",21);

CREATE TABLE COURCE
( ID INT PRIMARY KEY,
  NAME VARCHAR(40)
  );
  
INSERT INTO COURCE
(ID,Name)
VALUES
(102,"CSE"),
(104,"EEE"),
(103,"IOT"),
(108,"CSE");

SELECT*FROM st;
SELECT*FROM COURCE;

SELECT *
FROM st
INNER JOIN COURCE
ON st.ID = COURCE.ID;

SELECT *
FROM COURCE
RIGHT JOIN st
ON COURCE.ID = st.ID;

SELECT *
FROM st
LEFT JOIN COURCE
ON st.ID = COURCE.ID;

SELECT *
FROM st
LEFT JOIN COURCE
ON st.ID = COURCE.ID
UNION
SELECT *
FROM COURCE
RIGHT JOIN st
ON COURCE.ID = st.ID;

SELECT *
FROM COURCE
RIGHT JOIN st
ON COURCE.ID = st.ID
WHERE st.NAME IS null;

SELECT *
FROM st
LEFT JOIN COURCE
ON st.ID = COURCE.ID
WHERE COURCE.ID IS NULL;

  
