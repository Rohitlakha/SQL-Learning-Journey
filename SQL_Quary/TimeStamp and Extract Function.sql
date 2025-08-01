-- Show current timezone setting in PostgreSQL
SHOW TIMEZONE;

-- Get the current date and time (timestamp with time zone)
SELECT NOW();

-- Get the current timestamp with time zone as a human-readable string
SELECT TIMEOFDAY();

-- Get the current system time only (without date)
SELECT CURRENT_TIME;

-- Get today's date only (no time)
SELECT CURRENT_DATE;


-- Display all records from the payment table
SELECT * FROM payment;


-- Extract the month from each payment_date (returns 1–12)
SELECT EXTRACT(MONTH FROM payment_date) AS payment_month, payment_date
FROM payment;

-- Extract the year from each payment_date (e.g., 2025)
SELECT EXTRACT(YEAR FROM payment_date) AS pay_year, payment_date
FROM payment;

-- Extract the day of the week (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
SELECT EXTRACT(DOW FROM payment_date) AS pay_dow, payment_date
FROM payment;

-- Extract the day of the year (1 = Jan 1st, ..., 365/366 = Dec 31st)
SELECT EXTRACT(DOY FROM payment_date) AS pay_doy, payment_date
FROM payment;



-- Extract the day of the month (1–31)
SELECT EXTRACT(DAY FROM payment_date) AS pay_day, payment_date
FROM payment;

-- Extract the quarter (1 to 4) from the payment date
SELECT EXTRACT(QUARTER FROM payment_date) AS pay_quarter, payment_date
FROM payment;

-- Group payments by month and sum total amount paid
SELECT 
  EXTRACT(MONTH FROM payment_date) AS month, 
  SUM(amount) AS total_paid
FROM payment
GROUP BY month
ORDER BY month;

-- Show full month name instead of number (PostgreSQL only)
SELECT 
  TO_CHAR(payment_date, 'Month') AS month_name, 
  amount
FROM payment;
