CREATE DATABASE testdb
-- Create a table named 'customer' with columns and constraints
CREATE TABLE customer (
    CustID int PRIMARY KEY,             -- Customer ID (Primary Key)
    CustName varchar(50) NOT NULL,      -- Customer Name (required)
    Age int NOT NULL,                   -- Age (required)
    City char(50),                      -- City (optional)
    Salary numeric                      -- Salary (optional)
);

-- Insert sample records into the customer table
INSERT INTO customer (CustID, CustName, Age, City, Salary)
VALUES
    (1, 'sam', 26, 'Delhi', 9008),
    (2, 'Ram', 19, 'Bangalore', 11000),
    (3, 'Pam', 31, 'Mumbai', 6060),
    (4, 'Sam', 42, 'Pune', 10000);

-- View all records from the customer table
SELECT * FROM customer;

-- Update the name and age of the customer with CustID = 4
UPDATE customer
SET CustName = 'Rohit', Age = 20
WHERE CustID = 4;

-- Delete the customer record where CustID = 3
DELETE FROM customer
WHERE CustID = 3;


-- Create a table named 'classroom' with primary key and NOT NULL constraints
CREATE TABLE classroom (
    rollno int8 PRIMARY KEY,            -- Roll number (Primary Key)
    name varchar(50) NOT NULL,          -- Student name (required)
    house char(12) NOT NULL,            -- House name (required)
    grade char(1)                       -- Grade (optional)
);

-- Insert sample records into the classroom table
INSERT INTO classroom (rollno, name, house, grade)
VALUES
    (1, 'Sam', 'Akash', 'B'),
    (2, 'Ram', 'Agni', 'A'),
    (3, 'Shyam', 'Jal', 'B'),
    (4, 'Sundar', 'Agni', 'A'),
    (5, 'Ram', 'Yayu', 'B');

-- View all records from the classroom table
SELECT * FROM classroom;

-- Add a new column named 'Phone_no' to the classroom table
-- ❌ Incorrect: Missing data type
-- ✅ Corrected version:
ALTER TABLE classroom
ADD COLUMN Phone_no varchar(15);

-- Drop the Phone_no column from the classroom table
ALTER TABLE classroom
DROP COLUMN Phone_no;

-- ❌ Incorrect: You cannot ALTER a dropped column
-- ✅ You must re-add the column first before changing its type
-- This statement will give an error if run after dropping the column above
-- Correct sequence would be:
-- 1. ADD COLUMN Phone_no
-- 2. ALTER COLUMN Phone_no TYPE int
ALTER TABLE classroom
ALTER COLUMN Phone_no TYPE int;

-- Drop the entire classroom table
DROP TABLE classroom;

-- ⚠️ This will give an error if the table has already been dropped
-- Truncate removes all records without dropping the structure
TRUNCATE TABLE classroom;
