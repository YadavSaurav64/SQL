use company_db;

/* Retrieve all employee names and salaries. */
SELECT emp_name,salary FROM employees;

/* Find employees earning more than 60,000. */
SELECT emp_name,salary FROM employees WHERE salary > 60000;

/* Find employees with salaries between 50,000 and 70,000. */
SELECT emp_name,salary FROM employees WHERE salary BETWEEN 50000 AND 70000;

/* Retrieve the three highest-paid employees */
SELECT emp_name,salary FROM employees ORDER BY salary DESC LIMIT 3;

/* Find employees hired in 2023. */
SELECT emp_name,hire_date FROM employees WHERE YEAR(hire_date) = 2023;

/**/
SELECT emp_name,hire_date FROM employees WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';

/* Display uppercase employee names and their joining years.*/
SELECT UPPER(emp_name) AS emp_name, YEAR(hire_date) AS joining_year FROM employees;

/* Calculate a 10% bonus for each employee. */
SELECT emp_name,salary,ROUND(salary*1.10,2) AS bonus FROM employees;

/* Find the total and average salary of the company.*/
SELECT
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary
FROM employees;

/* Count employees in every department. */
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS employee_count
FROM dept AS d
LEFT JOIN employees AS e
    ON d.dept_id = e.dept_id
GROUP BY
    d.dept_id,
    d.dept_name
ORDER BY d.dept_id;

/**/
SELECT
    dept_id,
    COUNT(*) AS employee_count
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id;

/* Find departments with more than one employee. */
SELECT
    dept_id,
    COUNT(*) AS employee_count
FROM employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id
HAVING COUNT(*) > 1;

/* Find the highest salary in each department. */
SELECT
    dept_id,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY dept_id;

/* Display employees along with their department names. */
SELECT
    e.emp_name,
    d.dept_name
FROM employees AS e
INNER JOIN dept AS d
    ON e.dept_id = d.dept_id;

/* Find employees without a department. */
SELECT e.emp_id, e.emp_name
FROM employees AS e
LEFT JOIN dept AS d
    ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

/* Find departments without employees. */
SELECT d.dept_id, d.dept_name
FROM dept AS d
LEFT JOIN employees AS e
    ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

/* Display every employee and their manager's name. */
SELECT
    e.emp_name AS employee,
    m.emp_name AS manager
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.emp_id;

/* CTE: */

/* Find the second-highest distinct salary. */
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

/* Find the Nth-highest distinct salary. */

WITH ranked_salaries AS (
    SELECT
        salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS salary_rank
    FROM (
        SELECT DISTINCT salary
        FROM employees
    ) AS unique_salaries
)
SELECT DISTINCT salary
FROM ranked_salaries
WHERE salary_rank = 3;

/* Find employees earning more than the company average. */
SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

/* Find employees earning more than their department's average salary. */
SELECT
    e.emp_name,
    e.salary,
    e.dept_id
FROM employees AS e
WHERE e.dept_id IS NOT NULL
AND e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.dept_id = e.dept_id
);

/* Find departments that have employees using EXISTS. */
SELECT d.dept_name
FROM dept AS d
WHERE EXISTS (
    SELECT 1
    FROM employees AS e
    WHERE e.dept_id = d.dept_id
);