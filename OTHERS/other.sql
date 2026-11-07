use company_db;

EXPLAIN
SELECT *
FROM employees
WHERE salary > 60000;

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE salary > 60000;

/* views */
CREATE VIEW employee_details AS
SELECT
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name
FROM employees e
LEFT JOIN dept d
ON e.dept_id = d.dept_id;

SELECT *
FROM employee_details;

/**/
SELECT emp_name
FROM employee_details
WHERE salary > 60000;

/**/
DROP VIEW employee_details;

/* Temporary Tables */
/* A temporary table is a table that exists temporarily within a database session. */

/* A temporary table is session-scoped. Other sessions do not see the same temporary table.

Unlike a CTE, it can be reused by multiple statements in that session. */

CREATE TEMPORARY TABLE high_salary_employees AS
SELECT emp_id, emp_name, salary
FROM employees
WHERE salary > 60000;

SELECT *
FROM high_salary_employees;

/**/
DROP TEMPORARY TABLE high_salary_employees;


/* Stored procedures*/

/*A stored procedure is a set of SQL statements stored in the database and executed using CALL.

Use cases:
- Repeated database operations.
- Database-side business operations.
- Administrative tasks. */


CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT *
    FROM employees;
END 

CALL GetEmployees();

/*Parameterize Procedure*/
CREATE PROCEDURE GetEmployeesByDept(
    IN d_id INT
)
BEGIN
    SELECT emp_name, salary
    FROM employees
    WHERE dept_id = d_id;
END

CALL GetEmployeesByDept(1);

/*The IN parameter receives an input value.

OUT and INOUT parameters are also supported, but are not necessary for basic fresher preparation.*/