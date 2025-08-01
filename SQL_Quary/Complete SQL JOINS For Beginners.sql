-- 🌐 View complete customer data
SELECT * FROM customer3;

-- 💰 View complete payment data
SELECT * FROM payment;

-- 🔗 INNER JOIN: Only customers who made a payment
SELECT *
FROM customer3 AS c
INNER JOIN payment AS p
ON c.customer_id = p.customer_id;

-- 🎯 Specific fields with INNER JOIN
SELECT c.first_name, p.amount, p.payment_mode
FROM customer3 AS c
INNER JOIN payment AS p
ON c.customer_id = p.customer_id;

-- ⬅️ LEFT JOIN: All customers, even if they didn't make a payment
SELECT *
FROM customer3 AS c
LEFT JOIN payment AS p
ON c.customer_id = p.customer_id;

-- ➡️ RIGHT JOIN: All payments, even if customer info is missing
SELECT *
FROM customer3 AS c
RIGHT JOIN payment AS p
ON c.customer_id = p.customer_id;

-- 🔄 FULL OUTER JOIN: Combine both customer and payment data, even if unmatched
SELECT *
FROM customer3 AS c
FULL OUTER JOIN payment AS p
ON c.customer_id = p.customer_id;





-- View all records from customer3 table
SELECT * FROM customer3;

-- View all records from payment table
SELECT * FROM payment;


-- Join records from customer3 and payment where customer_id matches in both tables
-- Only customers who made a payment will be shown
SELECT *
FROM customer3 AS c
INNER JOIN payment AS p
ON c.customer_id = p.customer_id;

-- Select specific fields: first_name from customer3, and amount, payment_mode from payment
-- Only shows rows with matching customer_id in both tables
SELECT c.first_name, p.amount, p.payment_mode
FROM customer3 AS c
INNER JOIN payment AS p
ON c.customer_id = p.customer_id;


-- Returns all customers from customer3
-- If a customer did not make a payment, the payment fields will show NULL
SELECT *
FROM customer3 AS c
LEFT JOIN payment AS p
ON c.customer_id = p.customer_id;


-- Returns all payments from the payment table
-- If a customer_id in payment doesn't exist in customer3, the customer fields will be NULL
SELECT *
FROM customer3 AS c
RIGHT JOIN payment AS p
ON c.customer_id = p.customer_id;


-- Combines LEFT JOIN and RIGHT JOIN
-- Shows all records from both tables
-- If no match is found in either side, the missing side will show NULL
SELECT *
FROM customer3 AS c
FULL OUTER JOIN payment AS p
ON c.customer_id = p.customer_id;


