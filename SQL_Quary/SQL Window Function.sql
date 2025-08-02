-- 1. Create employee_sales table
CREATE TABLE employee_sales (
    emp_id INT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    sales INT
);

select * from employee_sales


-- 2. Insert sample records
INSERT INTO employee_sales (emp_id, emp_name, department, sales) VALUES
(1, 'Rohit', 'Electronics', 300),
(2, 'Simran', 'Electronics', 400),
(3, 'Aman', 'Electronics', 400),
(4, 'Priya', 'Fashion', 350),
(5, 'Deepak', 'Fashion', 200),
(6, 'Kiran', 'Fashion', 350),
(7, 'Mohan', 'Grocery', 500),
(8, 'Ravina', 'Grocery', 450);

-- 3. Use RANK(), DENSE_RANK(), ROW_NUMBER(), LEAD(), and LAG()
SELECT
    emp_id,
    emp_name,
    department,
    sales,

    -- Assigns ranking, skips next rank if tie
    RANK() OVER (PARTITION BY department ORDER BY sales DESC) AS rank_val,

    -- Assigns dense rank, no skipping for ties
    DENSE_RANK() OVER (PARTITION BY department ORDER BY sales DESC) AS dense_rank_val,

    -- Assigns a unique row number even for tied values
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY sales DESC) AS row_num,

    -- Next employee's sales in same department (look ahead)
    LEAD(sales) OVER (PARTITION BY department ORDER BY sales DESC) AS next_emp_sales,

    -- Previous employee's sales in same department (look behind)
    LAG(sales) OVER (PARTITION BY department ORDER BY sales DESC) AS prev_emp_sales

FROM employee_sales;

-- Use of window functions categorized by type
SELECT
    emp_id,
    emp_name,
    department,
    sales,

    -------------------- AGGREGATE WINDOW FUNCTIONS --------------------
    -- Total sales in each department
    SUM(sales) OVER (PARTITION BY department) AS dept_total_sales,

    -- Average sales per department
    AVG(sales) OVER (PARTITION BY department) AS dept_avg_sales,

    -- Max sales in department
    MAX(sales) OVER (PARTITION BY department) AS dept_max_sales,

    -- Cumulative (running) total of sales in department ordered by sales
    SUM(sales) OVER (PARTITION BY department ORDER BY sales) AS running_total,

    -------------------- RANKING FUNCTIONS --------------------
    RANK() OVER (PARTITION BY department ORDER BY sales DESC) AS sales_rank,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY sales DESC) AS sales_dense_rank,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY sales DESC) AS row_num,

    -------------------- VALUE / ANALYTIC FUNCTIONS --------------------
    -- Sales of next employee in department
    LEAD(sales) OVER (PARTITION BY department ORDER BY sales DESC) AS next_sales,

    -- Sales of previous employee in department
    LAG(sales) OVER (PARTITION BY department ORDER BY sales DESC) AS prev_sales,

    -- Difference with department average
    sales - AVG(sales) OVER (PARTITION BY department) AS diff_from_avg,

    -- First sale in department
    FIRST_VALUE(sales) OVER (PARTITION BY department ORDER BY sales DESC) AS top_sale,

    -- Last sale in department
    LAST_VALUE(sales) OVER (
        PARTITION BY department ORDER BY sales DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_sale

FROM employee_sales;

