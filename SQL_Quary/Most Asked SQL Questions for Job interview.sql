-- 📦 Create 'Products' table to store sales data
CREATE TABLE Products ( 
    Order_date DATE, 
    Sales INT 
); 

-- 📥 Insert sales records into 'Products'
INSERT INTO Products(Order_date, Sales)    
VALUES
 ('2021-01-01', 20), ('2021-01-02', 32), ('2021-02-08', 45), ('2021-02-04', 31),
 ('2021-03-21', 33), ('2021-03-06', 19), ('2021-04-07', 21), ('2021-04-22', 10);

-- 👁️ View data from 'Products' table
SELECT * FROM Products;

-- 📊 Monthly total sales grouped by year and month (sorted by sales descending)
SELECT 
    EXTRACT(YEAR FROM Order_date) AS years, 
    TO_CHAR(Order_date, 'Mon') AS months, 
    SUM(Sales) AS TotalSales
FROM Products
GROUP BY 1, 2
ORDER BY TotalSales DESC;

-- 👤 Create 'Applications' table to store candidate skills
CREATE TABLE Applications ( 
    candidate_id INT, 
    skills VARCHAR
); 

-- 📥 Insert candidate skill data into 'Applications'
INSERT INTO Applications(candidate_id, skills)    
VALUES
 (101, 'Power BI'), (101, 'Python'), (101, 'SQL'),
 (102, 'Tableau'), (102, 'SQL'),
 (108, 'Python'), (108, 'SQL'), (108, 'Power BI'),
 (104, 'Python'), (104, 'Excel');

-- 👁️ View data from 'Applications' table
SELECT * FROM Applications;

-- ✅ Find candidates who know all 3 skills: Python, SQL, and Power BI
SELECT 
    candidate_id, 
    COUNT(DISTINCT skills) AS skill_count
FROM Applications
WHERE skills IN ('Python', 'SQL', 'Power BI')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skills) = 3
ORDER BY candidate_id;
