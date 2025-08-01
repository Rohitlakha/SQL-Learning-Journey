-- Display all records from the 'payment3' table
SELECT * FROM payment3;

-- Calculate the average value of the 'amount' column
SELECT AVG(amount) FROM payment3;

-- Retrieve payment records where the amount is greater than 164 (a hardcoded average)
SELECT * 
FROM payment3
WHERE amount > 164;

-- Subquery: Fetch payments where amount is greater than the average amount dynamically
SELECT * 
FROM payment3
WHERE amount > (SELECT AVG(amount) FROM payment3);


-- Display all records from the 'customer3' table
SELECT * FROM customer3;

-- Fetch only the customer IDs from the 'customer3' table
SELECT customer_id FROM customer3;

-- Retrieve payment data for customers that exist in 'customer3' using IN clause
SELECT customer_id, amount, mode
FROM payment3
WHERE customer_id IN (SELECT customer_id FROM customer3);


-- Display all records from the 'payment3' table
SELECT * FROM payment3;

-- Retrieve customer IDs and amounts where payment amount is greater than 99
SELECT customer_id, amount
FROM payment3
WHERE amount > 99;

-- Use EXISTS to get first and last names of customers who made payments > 99
SELECT first_name, last_name
FROM customer3 c
WHERE EXISTS (
    SELECT customer_id, amount
    FROM payment3 p
    WHERE p.customer_id = c.customer_id
      AND amount > 99
);
