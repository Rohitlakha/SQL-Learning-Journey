-- Step 1: Create the 'travel' table with source, destination, and distance columns
CREATE TABLE travel (
    source VARCHAR(20),
    destination VARCHAR(20),
    distance INTEGER
);

-- Step 2: Insert sample route data into the travel table
INSERT INTO travel (source, destination, distance) VALUES
('Mumbai', 'Bangalore', 500),
('Bangalore', 'Mumbai', 500),
('Delhi', 'Mathura', 150),
('Mathura', 'Delhi', 150),
('Nagpur', 'Pune', 500),
('Pune', 'Nagpur', 500);

-- Step 3: View all records in the travel table
SELECT * FROM travel;

-- Step 4: Understand how GREATEST and LEAST functions work with numbers
SELECT greatest(2,1,11,4); -- Returns the largest number: 11
SELECT least(2,1,11,4);    -- Returns the smallest number: 1

-- Step 5: Understand how GREATEST and LEAST work with strings (alphabetical order)
SELECT greatest('Rohit', 'Vayu','Dharti'); -- Returns 'Vayu' (last in alphabetical order)
SELECT least('Rohit', 'Vayu','Dharti');    -- Returns 'Dharti' (first in alphabetical order)

-- Method 1: Using GREATEST and LEAST to remove bidirectional duplicates
-- This treats (A,B) and (B,A) as the same by sorting source & destination alphabetically
SELECT 
    greatest(source,destination) AS city1, 
    least(source,destination) AS city2, 
    MAX(distance) AS max_distance
FROM travel
GROUP BY greatest(source,destination), least(source,destination);

-- Method 2: Using SELF JOIN to get unique pairs (avoid reversed duplicates)
-- Adds row numbers to uniquely identify rows, then joins where one is reverse of the other
-- Keeps only the one with smaller row number to eliminate duplicate reverse routes
WITH cte AS (
    SELECT *, ROW_NUMBER() OVER() AS Sno
    FROM travel
)
SELECT t1.*
FROM cte AS t1
JOIN cte AS t2
  ON t1.source = t2.destination
 AND t1.destination = t2.source
 AND t1.Sno < t2.Sno;

-- Method 3: Using subquery to filter out reversed duplicate routes
-- Filters out one direction of any pair if its reverse already exists (alphabetically)
SELECT *
FROM travel t1
WHERE NOT EXISTS (
    SELECT * 
    FROM travel t2
    WHERE t1.source = t2.destination
      AND t1.destination = t2.source
      AND t1.destination > t2.destination
);
