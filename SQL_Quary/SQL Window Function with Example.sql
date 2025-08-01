-- 🏗️ Step 1: Create the Table
CREATE TABLE text_data (
    new_id INT,
    new_cat VARCHAR(50)
);

-- 📥 Step 2: Insert Data into text_data
INSERT INTO text_data (new_id, new_cat) VALUES
(100, 'Rohit'),
(200, 'Simran'),
(500, 'Aman'),
(700, 'Kiran'),
(200, 'Deepak'),
(300, 'Priya'),
(500, 'Jatin');

-- 🔍 Step 3: View the inserted data
SELECT * FROM text_data;

-- 📊 Step 4: Window Aggregate Functions with PARTITION BY new_cat
-- This calculates totals and stats for each category group
SELECT new_id, new_cat,
    SUM(new_id) OVER (PARTITION BY new_cat ORDER BY new_id) AS "Total",
    AVG(new_id) OVER (PARTITION BY new_cat ORDER BY new_id) AS "Average",
    COUNT(new_id) OVER (PARTITION BY new_cat ORDER BY new_id) AS "Count",
    MIN(new_id) OVER (PARTITION BY new_cat ORDER BY new_id) AS "Min",
    MAX(new_id) OVER (PARTITION BY new_cat ORDER BY new_id) AS "Max"
FROM text_data;

-- 📊 Step 5: Full Table Aggregation using Window Frame
-- Performs cumulative stats across all rows using the UNBOUNDED frame
SELECT new_id, new_cat,
    SUM(new_id) OVER (ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Total",
    AVG(new_id) OVER (ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Average",
    COUNT(new_id) OVER (ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Count",
    MIN(new_id) OVER (ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Min",
    MAX(new_id) OVER (ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Max"
FROM text_data;

-- 🪜 Step 6: Ranking Functions
-- Adds row number and rank-based values
SELECT new_id, new_cat,
    ROW_NUMBER() OVER (ORDER BY new_id) AS "ROW_NUMBER",
    RANK() OVER (ORDER BY new_id) AS "RANK",
    DENSE_RANK() OVER (ORDER BY new_id) AS "DENSE_RANK",
    PERCENT_RANK() OVER (ORDER BY new_id) AS "PERCENT_RANK"
FROM text_data;

-- 🔁 Step 7: Analytic (Value) Functions
-- Shows first, last, lead, and lag values in the window
SELECT new_id, new_cat,
    FIRST_VALUE(new_id) OVER (ORDER BY new_id) AS "FIRST_VALUE",
    LAST_VALUE(new_id) OVER (ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "LAST_VALUE",
    LEAD(new_id) OVER (ORDER BY new_id) AS "LEAD",
    LAG(new_id) OVER (ORDER BY new_id) AS "LAG"
FROM text_data;
