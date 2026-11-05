USE company_db;

SELECT DATABASE();

/* Count every employee: */
SELECT COUNT(*) AS total_employees
FROM employees;


/* Count employees whose department ID is not NULL: */
SELECT COUNT(dept_id) AS assigned_employees
FROM employees;


SELECT SUM(salary) AS total_salary FROM employees;

SELECT AVG(salary) AS avg_salary FROM employees;

SELECT
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM employees;

