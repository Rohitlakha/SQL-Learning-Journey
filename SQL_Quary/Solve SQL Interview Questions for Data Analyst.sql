-- Step 1: Create the 'match' table with a single column 'team'
CREATE TABLE match (
    team VARCHAR(20)
);

-- Step 2: Insert 4 teams into the 'match' table
INSERT INTO match (team) 
VALUES 
('India'), 
('Pak'), 
('Aus'), 
('Eng');

-- Step 3: Create the 'emp' table with two columns: ID and NAME
CREATE TABLE emp (
    ID INT,
    NAME VARCHAR(10)
);

-- Step 4: Insert 8 employees into the 'emp' table
INSERT INTO emp (ID, NAME) 
VALUES 
(1, 'Emp1'), 
(2, 'Emp2'), 
(3, 'Emp3'), 
(4, 'Emp4'), 
(5, 'Emp5'), 
(6, 'Emp6'), 
(7, 'Emp7'), 
(8, 'Emp8');


-- Step 1: Generate all unique combinations of teams for matches
WITH cte AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY team ASC) AS id
    FROM match
)
SELECT 
    a.team AS "Team-A", 
    b.team AS "Team-B"
FROM cte AS a
JOIN cte AS b 
    ON a.team <> b.team        -- Exclude same teams
   AND a.id < b.id;            -- Avoid reverse duplicates (A vs B, not B vs A)


-- Step 2: Divide employees equally into 4 groups using NTILE()
WITH CTE AS (
    SELECT 
        CONCAT(ID, ' ', NAME) AS con_name, 
        NTILE(4) OVER (ORDER BY ID ASC) AS groups
    FROM emp
)
SELECT 
    STRING_AGG(con_name, ', ') AS result, 
    groups
FROM CTE 
GROUP BY groups
ORDER BY groups;




