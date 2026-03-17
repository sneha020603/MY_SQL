SHOW databases;
CREATE DATABASE phase2;
USE phase2;

CREATE TABLE Student(
id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
marks INT
);

CREATE TABLE studentTable(
id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
marks INT,
courseID INT ,
FOREIGN KEY(courseID) references courseTable(courseID)
);

DROP TABLE studentTable;

INSERT INTO studentTable(id,name,marks,courseID)
VALUES
(1,'Itika',90,2),
(2,'Gour',87,1),
(3,'Shubham',78,2),
(4,'Rajat',95,3);

CREATE TABLE courseTable(
courseID INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
duration int
);

INSERT INTO courseTable(courseID, name, duration)
Values
(1,'Btech CSE',4),
(2,'Btech IT',4),
(3,'BCA',3);

SELECT * FROM courseTable;
SELECT * FROM studentTable;

ALTER TABLE studentTable ADD grade VARCHAR(10);
UPDATE studentTable SET name='ekta' 
WHERE id=1;

-- TCL
CREATE TABLE ST(
ID INT PRIMARY KEY,
NAME VARCHAR(50) ,
MASKS INT
);

START transaction;
INSERT INTO ST VALUES (1,'TOK',50);
SAVEPOINT S1;
INSERT INTO ST VALUES (2,'HOK',50);
SAVEPOINT S2;
INSERT INTO ST VALUES (3,'AOK',50);
SAVEPOINT S3;
INSERT INTO ST VALUES (4,'TOK',50);
SAVEPOINT S4;
   ROLLBACK TO S2;
   COMMIT;
   ROLLBACK TO S1; -- CANNT RUN AS ALREADY COMMITED THE CHANGES..
SELECT * FROM ST;
   
-- DCL
-- i am unable to find the user or it not working in my computer

-- operators in mySQL
CREATE TABLE CUST (
CUST_ID INT PRIMARY KEY,
PRODUCT_RATE INT,
AMOUNT INT
);

INSERT INTO CUST(CUST_ID,PRODUCT_RATE,AMOUNT)
VALUES
(1,100,3),
(2,50,4),
(3,200,5);

SELECT * FROM CUST;

-- LIKE
SELECT  name
FROM studentTable
WHERE name LIKE '%e%';

SELECT  *
FROM studentTable
WHERE name LIKE 'e%';

-- no. of employee in each dept
create table emi_dept(
  deptID varchar(10) primary key,
  dept varchar(50) not null,
  cID int
);

INSERT INTO emi_dept(deptID,dept,cID)
values
('d1','hr',1),
('d2','admin',2),
('d3','finance',3),
('d4','Technical',4),
('d5', 'r&d', 1);

select * from emi_dept;

create table emi_emp(
empID varchar(10) primary key,
name varchar(50) ,
salary int ,
deptID Varchar(10),
mngrID varchar(10),
dob date,
foreign key(mngrID) references emi_emp(empID)
);

SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO emi_emp (empID, name, salary,deptID, mngrID, dob)
VALUES
('e1', 'Arjun', 25000,'d1', 'e3', '1982-01-11'),
('e2', 'Ted', 12000,'d2', 'e3', '1976-07-21'),
('e3', 'Apurv', 20000,'d3', 'e6', '1978-05-28'),
('e4', 'Manpreet', 25000,'d1', 'e6', '1979-11-14'),
('e5', 'Dharamveer', 34000,'d1', 'e6', '1982-01-15'),
('e6', 'Nitish', 23000,'d3', 'e7', '1980-12-09'),
('e7', 'Saurabh', 67000,'d4', NULL, '1978-03-04');
 drop table emi_emp;

SELECT * FROM emi_emp;

SELECT d.dept, COUNT(e.empID) AS total_employees
FROM emi_emp e
LEFT JOIN emi_dept d
ON e.deptID = d.deptID
GROUP BY d.dept;
-- order by dept;

-- HAVING
SELECT d.dept, COUNT(e.empID) AS total_employees
FROM emi_emp e
LEFT JOIN emi_dept d
ON e.deptID = d.deptID
GROUP BY d.dept
HAVING count(e.empID) >1
order by total_employees desc;

-- views

-- crete view
create view v1 as 
select * from emi_dept where (cID%2) =0;
-- read view
 select * from v1;
 -- update view
 create or replace view v1 as 
select * from emi_dept where (cID%2) !=0;


-- indexing
create index i1 on emi_emp(name, deptID);
 DROP INDEX i1 on emi_emp;
 
 -- case statement
 create table product
 ( productID int primary key , name varchar(10), rating int);

select * from product;
INSERT INTO `phase2`.`product` (`productID`, `name`, `rating`) VALUES ('1', 'p1', '5');
INSERT INTO `phase2`.`product` (`productID`, `name`, `rating`) VALUES ('2', 'p2', '4');
INSERT INTO `phase2`.`product` (`productID`, `name`, `rating`) VALUES ('3', 'p3', '8');

select productID, name, rating,
case 
when rating < 3 then 'dont buy'
when rating < 5 and rating >3 then 'okay okay'
when rating = 5 then 'average'
when rating > 5 and rating <8 then 'great'
when rating > 8 then 'must buy'
else 'good'
end feedback
from product;
