use company_db;

SELECT
    emp_name,
    salary,
    AVG(salary) OVER() AS company_average
FROM employees;

SELECT
    emp_name,
    dept_id,
    salary,
    AVG(salary) OVER (
        PARTITION BY dept_id
    ) AS department_average
FROM employees;

SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC, emp_id ASC
    ) AS row_num
FROM employees;

/* RANK()
Assigns the same rank to tied values, then skips subsequent ranks.*/

/* DENSE_RANK()
Assigns the same rank to tied values without skipping the next rank. */

/*LAG() returns a previous row's value. */
SELECT
    emp_name,
    salary,
    LAG(salary) OVER (
        ORDER BY emp_id
    ) AS previous_salary
FROM employees;


/* LEAD() returns a subsequent row's value. */
SELECT
    emp_name,
    salary,
    LEAD(salary) OVER (
        ORDER BY emp_id
    ) AS next_salary
FROM employees;

/*
GROUP BY	Window functions
Combines rows into groups	Retains individual rows
One output row per group	Usually one output row per input row
Aggregates group data	Calculates values over related rows
Useful for reports and totals	Useful for rankings and comparisons */

