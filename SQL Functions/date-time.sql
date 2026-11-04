SELECT VERSION();

SHOW DATABASES;

USE company_db;

SELECT DATABASE();

SHOW TABLES;

SELECT NOW();

SELECT CURDATE();
SELECT CURTIME();

SELECT emp_name, YEAR(hire_date) AS hire_year, MONTH(hire_date) AS hire_month FROM employees;

SELECT
    emp_name,
    DATEDIFF(CURDATE(), hire_date) AS days_worked
FROM employees;


SELECT
    emp_name,
    DATE_FORMAT(hire_date, '%d-%m-%Y') AS formatted_date
FROM employees;

/*

Format	Meaning
%Y	Four-digit year
%y	Two-digit year
%m	Month number
%d	Day
%M	Full month name

*/

