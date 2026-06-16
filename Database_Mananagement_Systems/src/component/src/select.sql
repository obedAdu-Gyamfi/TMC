-- All columns and all rows
SELECT * FROM students;
-- PostgreSQL is case-insensitive: STUDENTS == students

-- Specific columns only
SELECT name, email FROM students;

-- Filter with a condition
SELECT name, email FROM students
WHERE enrolled = TRUE;

-- Sort results alphabetically
SELECT * FROM students ORDER BY name ASC;

-- Return only the first 5 rows
SELECT * FROM students LIMIT 5;