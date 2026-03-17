-- ==============================
-- 📂 Table Operations
-- ==============================

-- CREATE TABLE
CREATE TABLE student (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT NOT NULL
);

-- INSERT INTO
INSERT INTO student (ID, Name, Age)
VALUES
(1, 'Sneha', 22),
(2, 'Pranjali', 22),
(3, 'Alka', 21);

-- VIEW DATA
SELECT * FROM student;

-- ALTER TABLE (ADD COLUMN)
ALTER TABLE student
ADD COLUMN City VARCHAR(20);

-- ALTER TABLE (MODIFY COLUMN)
ALTER TABLE student
MODIFY Age VARCHAR(3);

-- ALTER TABLE (RENAME COLUMN)
ALTER TABLE student
CHANGE Age Student_Age INT;

-- ALTER TABLE (DROP COLUMN)
ALTER TABLE student
DROP COLUMN City;

-- DROP TABLE
DROP TABLE IF EXISTS student;