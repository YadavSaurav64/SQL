SELECT VERSION();

SHOW DATABASES;

USE company_db;

SELECT DATABASE();

SHOW TABLES;

SELECT CONCAT(emp_name,' earns ',salary) AS employee_salary FROM employees;

SELECT
    UPPER(emp_name) AS uppercase_name,
    LOWER(emp_name) AS lowercase_name
FROM employees;

SELECT
    emp_name,
    LENGTH(emp_name) AS name_length
FROM employees;

SELECT CHAR_LENGTH(emp_name) as character_length
FROM employees;

SELECT TRIM('   Rahul   ') AS clean_name;

SELECT SUBSTRING('Engineering', 1, 4) AS short_name;

SELECT REPLACE('MySQL Interview', 'Interview', 'Practice');
