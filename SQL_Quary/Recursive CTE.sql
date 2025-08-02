-- ✅ Create table 'employees' with a self-referencing column 'manager_id'
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR NOT NULL,
    manager_id INT
);

-- ✅ Insert data into 'employees' table
INSERT INTO employees (emp_id, emp_name, manager_id)
VALUES
    (1, 'Madhav', NULL),    -- Top-level manager
    (2, 'Sam', 1),          -- Reports to Madhav
    (3, 'Tom', 2),          -- Reports to Sam
    (4, 'Arjun', 6),        -- Reports to Keshav
    (5, 'Shiva', 4),        -- Reports to Arjun
    (6, 'Keshav', 1),       -- Reports to Madhav
    (7, 'Damodar', 5);      -- Reports to Shiva

-- ✅ Simple Recursive CTE example to generate numbers from 1 to 3
WITH RECURSIVE my_CTE AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM my_CTE
    WHERE n < 3
)
SELECT * FROM my_CTE;

-- ✅ Recursive CTE to find the manager chain for a given employee (emp_id = 7)
WITH RECURSIVE EmpCTE AS (
    -- 🔹 Anchor member: Start with employee ID 7
    SELECT emp_id, emp_name, manager_id
    FROM employees
    WHERE emp_id = 7

    UNION ALL

    -- 🔹 Recursive member: Join employees to find their manager
    SELECT e.emp_id, e.emp_name, e.manager_id
    FROM employees e
    INNER JOIN EmpCTE ec
        ON e.emp_id = ec.manager_id
)

-- 🔽 Final result: Shows the employee and their hierarchy of managers
SELECT * FROM EmpCTE;
