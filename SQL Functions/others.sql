SELECT DATABASE();

/* 

Problem: Categorize employees according to salary.

*/

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;

/* Null Functions */

SELECT
    emp_name,
    COALESCE(dept_id, 0) AS department
FROM employees;

/*  
Returns the first non-NULL value.

Isha's NULL department ID is displayed as 0. */

SELECT
    emp_name,
    IFNULL(department_id, -1) AS department
FROM employees;

/* Takes two arguments. It returns the second if the first is NULL. */

/* 
COALESCE is SQL-standard and supports multiple arguments. IFNULL is a MySQL-specific two-argument function.
*/

/* type casting*/
SELECT CAST('2026-11-02' AS DATE);


SELECT CAST('12345' AS UNSIGNED);


SELECT CONVERT('2026-11-02', DATE);