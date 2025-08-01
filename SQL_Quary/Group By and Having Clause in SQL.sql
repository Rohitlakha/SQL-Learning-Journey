-- Select all records from the payment table
SELECT * FROM payment;

-- Group the payments by payment mode and calculate the total amount for each
-- Order the results by total amount in ascending order
SELECT payment_mode, SUM(amount) AS Total
FROM payment
GROUP BY payment_mode
ORDER BY Total ASC;

-- Group payments by mode, count how many payments per mode
-- Show only those with 3 or more payments
-- Order results by count in descending order
SELECT payment_mode, COUNT(amount) AS total
FROM payment
GROUP BY payment_mode
HAVING COUNT(amount) >= 3
ORDER BY total DESC;
