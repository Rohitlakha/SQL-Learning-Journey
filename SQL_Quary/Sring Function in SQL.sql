-- Select all data from customer2 table
SELECT * FROM customer2;

-- Convert all first names to UPPERCASE
SELECT UPPER(first_name) FROM customer2;

-- Convert all first names to lowercase
SELECT LOWER(first_name) FROM customer2;

-- Get the length (number of characters) of each first name
SELECT LENGTH(first_name), first_name FROM customer2;

-- Extract first 3 characters from each first name (Substring)
SELECT SUBSTRING(first_name, 1, 3), first_name FROM customer2;

-- Concatenate first name and last name (no space in between)
SELECT CONCAT(first_name, last_name), first_name, last_name FROM customer2;

-- Replace 'Mary' with 'Mohan' in first_name if it matches
SELECT REPLACE(first_name, 'Mary', 'Mohan'), first_name, last_name FROM customer2;


-- Concatenate first and last name with a space in between using CONCAT_WS (With Separator)
SELECT CONCAT_WS(' ', first_name, last_name) AS full_name FROM customer2;

-- Return position of substring 'ar' in first name (0 if not found)
SELECT POSITION('ar' IN first_name), first_name FROM customer2;

-- Remove leading and trailing spaces from first name
SELECT TRIM(first_name) AS trimmed_name FROM customer2;

-- Left pad the first name with '*' to make it 10 characters long
SELECT LPAD(first_name, 10, '*') AS padded_name FROM customer2;

-- Right pad the first name with '-' to make it 10 characters long
SELECT RPAD(first_name, 10, '-') AS padded_name FROM customer2;

-- Reverse the characters in the first name
SELECT REVERSE(first_name) AS reversed_name FROM customer2;

-- Extract initials (first character of first and last name)
SELECT CONCAT(LEFT(first_name, 1), '.', LEFT(last_name, 1), '.') AS initials FROM customer2;


-- Get the current system date and time (timestamp)
SELECT NOW() AS current_datetime;

-- Get only the current date (no time)
SELECT CURRENT_DATE AS today;

-- Get only the current time (no date)
SELECT CURRENT_TIME AS current_time;



-- Format a number as a string with commas (e.g., 1000000 becomes '1,000,000')
-- PostgreSQL does NOT have FORMAT() for numbers by default, but MySQL does
-- ✅ For MySQL:
SELECT FORMAT(1234567.89, 2) AS formatted_number;  -- Output: '1,234,567.89'

-- ✅ PostgreSQL way (using TO_CHAR):
SELECT TO_CHAR(1234567.89, 'FM9,999,999.00') AS formatted_number;

-- Format current date using a specific pattern
-- ✅ PostgreSQL:
SELECT TO_CHAR(NOW(), 'YYYY-MM-DD HH24:MI:SS') AS formatted_datetime;

-- ✅ MySQL: Use DATE_FORMAT
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS formatted_datetime;
