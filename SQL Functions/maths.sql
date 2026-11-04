SELECT VERSION();

SHOW DATABASES;

USE company_db;

SELECT DATABASE();

SHOW TABLES;

SELECT ROUND(65432.678, 2);

SELECT CEIL(12.2);

SELECT FLOOR(12.9);

SELECT ABS(-50);

SELECT
    emp_name,
    salary,
    ROUND(salary * 0.10, 2) AS ten_percent_bonus
FROM employees;