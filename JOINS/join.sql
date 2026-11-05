

USE company_db;


SELECT
    e.emp_name,
    d.dept_name
FROM employees AS e
INNER JOIN dept AS d
    ON e.dept_id = d.dept_id;

SELECT
    e.emp_name,
    d.dept_name
FROM employees AS e
LEFT JOIN dept AS d
    ON e.dept_id = d.dept_id;


SELECT
    e.emp_name,
    d.dept_name
FROM employees AS e
RIGHT JOIN dept AS d
    ON e.dept_id = d.dept_id;

/* 
Many developers prefer LEFT JOIN by reversing table order instead of using RIGHT JOIN. Both have their purposes.
*/


SELECT
    e.emp_name,
    d.dept_name
FROM employees AS e
CROSS JOIN dept AS d;

/* 

Ten employees × five departments = 50 combinations.

This is called a Cartesian product.

Use it only when you genuinely need every combination.

*/


SELECT
    e.emp_name AS employee,
    m.emp_name AS manager
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.emp_id;



/* joing 3 tables */

/* 

SELECT ...
FROM table_a AS a
JOIN table_b AS b
    ON a.common_id = b.common_id
JOIN table_c AS c
    ON b.common_id = c.common_id;

*/


/*Find departments without employees: */

SELECT d.dept_id, d.dept_name
FROM dept AS d
LEFT JOIN employees AS e
    ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

/* Find employees without a matching department: */

SELECT e.emp_name
FROM employees AS e
LEFT JOIN dept AS d
    ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

/* Count employees in each department using a JOIN and GROUP BY. */

SELECT 
    d.dept_name,
    COUNT(e.emp_id) AS total_employees
FROM employees e
INNER JOIN dept d
    ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name;