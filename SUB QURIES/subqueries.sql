USE company_db;

SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

SELECT emp_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

SELECT dept_id, avg_salary
FROM (
    SELECT
        dept_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
) AS department_summary
WHERE avg_salary > 60000;

/* 

The inner query creates a result that behaves like a temporary table for the outer query.

Important: A derived table must have an alias in MySQL. Here, it is department_summary.

*/

SELECT
    emp_name,
    salary,
    (SELECT AVG(salary) FROM employees) AS company_average
FROM employees;

/* 

Problem: Find employees earning more than their own department's average salary.

*/

SELECT e.emp_name, e.salary, e.dept_id
FROM employees AS e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.dept_id = e.dept_id
);
/*Isha has a NULL department, so the equality check for her department does not match any row and the correlated average becomes NULL. She is not returned.*/

/*Find departments that have employees:*/
SELECT d.dept_id, d.dept_name
FROM dept AS d
WHERE EXISTS (
    SELECT 1
    FROM employees AS e
    WHERE e.dept_id = d.dept_id
);

/*SELECT 1 is commonly used because the existence of a row matters, not its displayed value.*/


/* 

Find departments without employees:

*/

SELECT d.dept_id, d.dept_name
FROM dept AS d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees AS e
    WHERE e.dept_id = d.dept_id
);

/*NOT EXISTS is often a safer alternative to NOT IN when NULL values might be present. */


/* ANY  and ALL */


/* ANY means the comparison is true for at least one value. */

SELECT emp_name, salary
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE dept_id = 2
);

/*ALL requires the comparison to hold for every returned value. */

SELECT emp_name, salary
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE dept_id = 2
);


/* CTE : Common Table Expression */

/*
A CTE is a named temporary result set that exists for one SQL statement.

It is introduced using WITH.
*/


WITH dept_salary AS (
    SELECT
        dept_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
)
SELECT *
FROM dept_salary
WHERE avg_salary > 60000;

/* multiple CTE */

WITH department_salary AS (
    SELECT
        dept_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
),
high_salary_departments AS (
    SELECT dept_id, avg_salary
    FROM department_salary
    WHERE avg_salary > 60000
)
SELECT *
FROM high_salary_departments;

/*
JOIN	Combine related tables
Subquery	Use one query's result inside another
CTE	Name and organize intermediate query results

They can sometimes solve the same problem. /*