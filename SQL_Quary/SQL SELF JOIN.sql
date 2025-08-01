-- Create 'employy' table to store employees and their managers
CREATE TABLE employy (
    empid INT PRIMARY KEY,
    empname VARCHAR(100),
    manager_id INT
);

-- Insert sample employee data
-- Note: manager_id refers to the empid of their manager
INSERT INTO employy (empid, empname, manager_id) VALUES
(1, 'Rohit', NULL),       -- Rohit is CEO (no manager)
(2, 'Simran', 1),         -- Simran reports to Rohit
(3, 'Aman', 1),           -- Aman reports to Rohit
(4, 'Kiran', 2),          -- Kiran reports to Simran
(5, 'Deepak', 2),         -- Deepak reports to Simran
(6, 'Priya', 3);          -- Priya reports to Aman

-- Self join to show each employee with their manager (excluding top-level manager with NULL)
SELECT *
FROM employy AS T1
JOIN employy AS T2
ON T2.empid = T1.manager_id;

-- Clear output: List each employee with their manager's name
SELECT e.empid AS Employee_ID, 
       e.empname AS Employee_Name, 
       m.empname AS Manager_Name
FROM employy AS e
LEFT JOIN employy AS m
ON e.manager_id = m.empid;


-- Create table 'custA'
CREATE TABLE custA (
    cust_name VARCHAR(50),
    cust_amount INT
);

-- Create table 'custB'
CREATE TABLE custB (
    cust_name VARCHAR(50),
    cust_amount INT
);

-- Insert data into custA
INSERT INTO custA (cust_name, cust_amount) VALUES
('Rohit', 500),
('Simran', 1000),
('Aman', 750),
('Kiran', 1000);

-- Insert data into custB
-- Note: Some values intentionally match custA to test UNION behavior
INSERT INTO custB (cust_name, cust_amount) VALUES
('Simran', 1000),    -- Duplicate
('Ravina', 900),
('Rohit', 500),      -- Duplicate
('Jatin', 1200);


-- UNION: Combines both tables but removes duplicates
SELECT cust_name, cust_amount FROM custA
UNION
SELECT cust_name, cust_amount FROM custB;

-- Output: Unique records from both tables


-- UNION ALL: Combines both tables and keeps duplicates
SELECT cust_name, cust_amount FROM custA
UNION ALL
SELECT cust_name, cust_amount FROM custB;

-- Output: All records including duplicates
