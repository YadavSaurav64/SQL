SELECT VERSION();

SHOW DATABASES;

USE company_db;

SELECT DATABASE();

SHOW TABLES;

SELECT COUNT(*) AS total_employees,
SUM(salary) AS total_salary,
AVG(salary) AS average_salary
FROM employees;

SELECT * FROM employees;

SELECT * FROM dept;

SELECT emp_name, salary FROM employees;

SELECT * FROM employees WHERE salary > 60000;

SELECT DISTINCT dept_id FROM employees;

SELECT * FROM employees WHERE salary >= (SELECT AVG(salary) FROM employees);
/* it is little bit of sub quesries and aggregate function */

SELECT emp_name AS name, salary AS monthly_salary FROM employees;

SELECT e.emp_name,e.salary FROM employees AS e;

/* little advance */

SELECT emp_name,salary FROM employees ORDER BY salary DESC;

/* BY DEAFULT it is ASC */
SELECT emp_name,salary FROM employees ORDER BY salary;

/* mutliple comlumns */

SELECT emp_name,salary,dept_id FROM employees ORDER BY dept_id ASC, salary DESC;

/* Limit and Offset*/

SELECT emp_name,salary FROM employees LIMIT 3;

SELECT emp_id,emp_name,salary FROM employees ORDER BY emp_id LIMIT 3 OFFSET 5;

SELECT emp_id,emp_name,salary FROM employees ORDER BY salary DESC LIMIT 5;

/* GENERAL SYNTAX :

SELECT columns
FROM table_name
ORDER BY column_name
LIMIT number_of_rows OFFSET number_of_rows_to_skip;

*/