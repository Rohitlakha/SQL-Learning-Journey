-- View all records in the payment table
SELECT * FROM payment;

-- Count the total number of records (rows) in the payment table
SELECT COUNT(*) FROM payment;

-- Calculate the total (sum) of all 'amount' values
SELECT SUM(amount) FROM payment;

-- Find the highest payment amount in the table
SELECT MAX(amount) FROM payment;

-- Calculate the average payment amount
SELECT AVG(amount) FROM payment;

-- Calculate the average payment amount and round it to 2 decimal places
SELECT ROUND(AVG(amount), 2) FROM payment;
