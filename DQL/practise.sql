SELECT VERSION();

SHOW DATABASES;

USE company_db;

SELECT DATABASE();

SHOW TABLES;

/* Find Engineering employees earning at least 60,000:  */

SELECT emp_name, salary
FROM employees
WHERE dept_id = 1
AND salary >= 60000;

/* Find employees hired in 2023 or 2024 who earn more than 50,000:  */

SELECT emp_name,hire_date,salary FROM employees WHERE YEAR(hire_date) IN (2023,2024) AND salary > 50000;

/*  Find employees whose salary is not between 50,000 and 70,000: */

SELECT emp_name, salary FROM employees WHERE salary NOT  BETWEEN 50000 AND 70000;

/* Employees hired after January 1, 2023. */

SELECT emp_name , hire_date FROM employees WHERE hire_date >= '2023-01-01';

/* Employees who have a manager. */

SELECT emp_name,manager_id FROM employees WHERE manager_id IS NOT NULL;

/* Employees without a manager. */

SELECT emp_name,manager_id FROM employees WHERE manager_id IS NULL;

/*Employees who are not assigned to HR or Finance.*/

select emp_name,dept_id FROM employees WHERE dept_id NOT IN (2,3);

