
-- 🔍 View all records from both tables
SELECT * FROM payment2;
SELECT * FROM customer2;

-- ✅ 1st CTE: Join payment2 and customer2 and apply window functions
WITH my_cte AS (
    SELECT  
        p.*, 
        c.first_name, 
        c.last_name, 
        AVG(p.amount) OVER(ORDER BY p.customer_id) AS Average_Price, 
        COUNT(c.address_id) OVER(ORDER BY c.customer_id) AS Count
    FROM payment2 AS p
    INNER JOIN customer2 AS c
        ON p.customer_id = c.customer_id
)
-- 🔽 Final selection from first CTE to show customer names
SELECT first_name, last_name
FROM my_cte;

-- ✅ 2nd CTE Chain: Combine payment2+customer2 and customer2+address+country
WITH my_cp AS (
    -- 🔍 Join payment2 with customer2 and apply window functions
    SELECT  
        p.*, 
        c.first_name, 
        c.last_name, 
        AVG(p.amount) OVER(ORDER BY p.customer_id) AS Average_Price, 
        COUNT(c.address_id) OVER(ORDER BY c.customer_id) AS Count
    FROM payment2 AS p
    INNER JOIN customer2 AS c
        ON p.customer_id = c.customer_id
),
my_ca AS (
    -- 🔍 Join customer2 with address and country tables
    SELECT 
        c.customer_id,
        c.address_id,
        c.first_name,
        c.last_name,
        a.city,
        cc.country
    FROM customer2 AS c
    INNER JOIN address AS a
        ON a.address_id = c.address_id
    INNER JOIN country AS cc
        ON cc.city_id = a.city_id
)
-- 🔽 Final selection combining both CTEs
SELECT 
    cp.first_name, 
    cp.last_name, 
    ca.city, 
    ca.country, 
    cp.amount
FROM my_ca AS ca
JOIN my_cp AS cp
    ON ca.customer_id = cp.customer_id;

-- ✅ 3rd CTE: Aggregate max and sum by payment mode
WITH my_cte_mode AS (
    SELECT 
        mode, 
        MAX(amount) AS highest_price, 
        SUM(amount) AS total_price
    FROM payment2
    GROUP BY mode
)
-- 🔽 Final selection to join summary back to main table
SELECT 
    p.*, 
    m.highest_price, 
    m.total_price
FROM payment2 AS p
JOIN my_cte_mode AS m
    ON p.mode = m.mode
ORDER BY p.mode;


