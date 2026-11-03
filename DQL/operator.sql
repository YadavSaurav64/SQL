SELECT VERSION();

SHOW DATABASES;

USE company_db;

SELECT DATABASE();

SHOW TABLES;

SELECT emp_name, salary
FROM employees
WHERE salary >= 70000;

SELECT emp_name, salary, dept_id
FROM employees
WHERE salary > 50000
AND dept_id = 1;

SELECT emp_name, dept_id
FROM employees
WHERE dept_id = 1
OR dept_id = 3;

SELECT emp_name
FROM employees
WHERE NOT dept_id = 1 OR dept_id IS NULL;

SELECT emp_name, dept_id
FROM employees
WHERE dept_id IN (1, 3, 5);

SELECT emp_name, dept_id
FROM employees
WHERE dept_id NOT IN (1, 3, 5);

SELECT emp_name, salary
FROM employees
WHERE salary BETWEEN 50000 AND 70000;

/* IS EQUIVALENT TO */
SELECT emp_name, salary
FROM employees
WHERE salary >= 50000
AND salary <= 70000;

/* LIKE OPERATOR */

SELECT emp_name FROM employees
WHERE emp_name LIKE 'R%';

SELECT emp_name FROM employees
WHERE emp_name LIKE '%a';

SELECT emp_name FROM employees
WHERE emp_name LIKE '%ee%';

SELECT emp_name FROM employees
WHERE emp_name LIKE 'R___';

/* IS NULL and IS NOT NULL */

SELECT emp_name FROM employees WHERE dept_id IS NULL;

SELECT emp_name FROM employees WHERE dept_id IS NOT NULL;