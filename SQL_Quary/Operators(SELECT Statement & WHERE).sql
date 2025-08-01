-- Select only the 'name' column from the classroom table
SELECT name FROM classroom;

-- Select name, roll number, and grade columns from the classroom table
SELECT name, rollno, grade FROM classroom;

-- Select all columns (*) from the classroom table
SELECT * FROM classroom;

-- Select unique/distinct grade values from the classroom table
SELECT DISTINCT grade FROM classroom;

-- Select names of students whose grade is 'A'
SELECT name FROM classroom
WHERE grade = 'A';

-- Select all columns of students who have grade 'A' and roll number greater than 3
SELECT * FROM classroom
WHERE grade = 'A' AND rollno > 3;

-- Select first 2 student names (top 2 rows only)
SELECT name FROM classroom
LIMIT 2;

-- Select names of students, sorted in ascending (A–Z) order
SELECT name FROM classroom
ORDER BY name ASC;
