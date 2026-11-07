use company_db;

/* 1. Number employees by salary. */
SELECT
    emp_id,
    emp_name,
    salary,
    ROW_NUMBER() OVER () AS row_num
FROM employees;


/*2. Rank employees by salary.*/
SELECT
    emp_id,
    emp_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;


/*3. Rank employees by salary inside each department.*/
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    salary,
    RANK() OVER (
        PARTITION BY e.dept_id
        ORDER BY e.salary DESC
    ) AS dept_rank
FROM employees e LEFT JOIN dept d ON e.dept_id = d.dept_id;


/*4. Find the top two salaries in every department.*/
WITH ranked_employees AS (
    SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY e.dept_id
        ORDER BY e.salary DESC
    ) AS salary_rank
FROM employees e LEFT JOIN dept d ON e.dept_id = d.dept_id
)
SELECT *
FROM ranked_employees
WHERE salary_rank <= 2;


/*5. Compare each employee's salary with the previous employee's salary.*/
SELECT
    emp_id,
    emp_name,
    salary,
    LAG(salary) OVER (
        ORDER BY emp_id
    ) AS previous_salary
FROM employees;

/* to get diff */
SELECT
    emp_id,
    emp_name,
    salary,
    LAG(salary) OVER (ORDER BY emp_id) AS previous_salary,
    salary - LAG(salary) OVER (ORDER BY emp_id) AS salary_difference
FROM employees;


/*6. Calculate a running salary total.*/
SELECT
    emp_id,
    name,
    salary,
    SUM(salary) OVER (
        ORDER BY emp_id
    ) AS running_total
FROM employees;

/* to get department specific running total */
SELECT
    emp_id,
    name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
        ORDER BY emp_id
    ) AS running_total
FROM employees;


/*7. Display each employee alongside their department average.*/
SELECT
    emp_id,
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_avg
FROM employees;


/*8. Find the second-highest distinct salary using DENSE_RANK.*/
WITH salary_ranking AS (
    SELECT
        salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)
SELECT DISTINCT salary
FROM salary_ranking
WHERE salary_rank = 2;