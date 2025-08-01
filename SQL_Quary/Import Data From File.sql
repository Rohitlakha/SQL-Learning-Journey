-- Create a table named 'customer2' with relevant customer fields
CREATE TABLE customer2 (
    customer_id int8 PRIMARY KEY,        -- Unique customer ID (Primary Key)
    first_name varchar(50),              -- Customer's first name
    last_name varchar(50),               -- Customer's last name
    email varchar(100),                  -- Customer email address
    address_id int8                      -- Address ID (foreign key relationship possible)
);

-- Display all records from the customer2 table
SELECT * FROM customer2;

-- Copy data into customer2 table from a CSV file
-- ✅ Make sure the path is accessible to the database and properly formatted
COPY customer2(customer_id, first_name, last_name, email, address_id)
FROM 'D:\customer.csv'
DELIMITER ','        -- Use comma as delimiter
CSV HEADER;          -- The first row in the file is treated as header


-- Create a table named 'pyament' (note: there is a typo in the name)
CREATE TABLE pyament (
    customer_id int8 PRIMARY KEY,       -- Unique customer ID (Primary Key)
    amount int8 NOT NULL,               -- Amount paid (required)
    payment_mode varchar(50),           -- Mode of payment (e.g., Cash, Card)
    payment_date date                   -- Date of payment
);

-- ❌ This will give an error because the table name is 'pyament', not 'payment'
-- ✅ Corrected:
SELECT * FROM pyament;

-- Copy data into pyament table from a CSV file
-- ✅ Ensure file path, permissions, and column alignment are correct
COPY pyament(customer_id, amount, payment_mode, payment_date)
FROM 'D:\payment.csv'
DELIMITER ','        -- Use comma as separator
CSV HEADER;          -- Skip header row

-- Rename table 'pyament' to correct name 'payment'
ALTER TABLE pyament RENAME TO payment;


