use company_db;

/*
Find employees earning more than the company average.
*/
SELECT emp_name,salary,(SELECT AVG(salary) AS avg_salary FROM employees) FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);


/*
Find employees with the highest salary.
*/


SELECT emp_name,salary,dept_id FROM employees e1 WHERE salary = (SELECT MAX(salary) FROM employees e2 WHERE e1.dept_id=e2.dept_id);



/**/
WITH dept_max AS (
    SELECT
        dept_id,
        MAX(salary) AS max_salary
    FROM employees
    GROUP BY dept_id
)

SELECT e.emp_name,e.salary,e.dept_id
FROM employees e
JOIN dept_max dm
    ON e.dept_id = dm.dept_id
    AND e.salary = dm.max_salary;


/*
Find employees earning more than their department average.
*/

SELECT emp_name ,salary, dept_id FROM employees e1 WHERE salary > (SELECT AVG(salary) FROM employees e2 WHERE e1.dept_id = e2.dept_id);


/*
Find departments with employees using EXISTS.
*/
SELECT d.dept_id, d.dept_name FROM dept d WHERE EXISTS (SELECT 1 FROM employees e WHERE d.dept_id = e.dept_id);

/*
Find departments without employees using NOT EXISTS.
*/
SELECT d.dept_id, d.dept_name FROM dept d WHERE NOT EXISTS (SELECT 1 FROM employees e WHERE d.dept_id = e.dept_id);

/*
Find average salaries using a CTE.
*/
WITH avg_sal AS (
    SELECT dept_id,AVG(salary) AS avg_salary FROM employees GROUP BY dept_id
)

SELECT * FROM avg_sal;

/*
Create two CTEs to identify high-paying departments.
*/

WITH dept_avg AS (
  SELECT dept_id,AVG(salary) AS avg_salary FROM employees GROUP BY dept_id
),

company_avg AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)

SELECT
    d.dept_name,
    da.avg_salary
FROM dept_avg da
JOIN dept d
    ON da.dept_id = d.dept_id
CROSS JOIN company_avg ca
WHERE da.avg_salary > ca.avg_salary;

/*
Rewrite one subquery as a JOIN.
*/

SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

SELECT e.*
FROM employees e
CROSS JOIN (
    SELECT AVG(salary) AS avg_salary
    FROM employees
) ca
WHERE e.salary > ca.avg_salary;


/**/
WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)

SELECT e.*
FROM employees e
CROSS JOIN company_avg ca
WHERE e.salary > ca.avg_salary;