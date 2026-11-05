USE company_db;

SELECT DATABASE();

/*  

How GROUP BY works:-

All employee rows
10 records

GROUP BY department_id

Dept 1
Rahul, Priya, Riya

Dept 3
Neha, Karan


Other
HR, Marketing, Sales, NULL


One aggregate result per group
COUNT · SUM · AVG · MIN · MAX

 */

SELECT
    dept_id,
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id;

/* All NULL department IDs form one group. */

/* using multiple columns in GROUP BY */
SELECT
    dept_id,
    YEAR(hire_date) AS hire_year,
    COUNT(*) AS employee_count
FROM employees
GROUP BY
    dept_id,
    YEAR(hire_date);
/*
This calculates employee counts per department per hiring year.
 */

 /* having */

/* WHERE filters rows before grouping.

HAVING filters groups after grouping. */

/* Problem: Find departments with more than one employee. */
SELECT dept_id, COUNT(*) AS employee_count FROM employees GROUP BY dept_id HAVING COUNT(*) > 1;

/* 

WHERE	                 HAVING
Filters individual rows	Filters groups
Applied before GROUP     BY	Applied after grouping
Normally does not use aggregate conditions	Commonly uses aggregate conditions

*/

/* USING BOTH */

SELECT
    dept_id,
    AVG(salary) AS avg_salary
FROM employees
WHERE salary >= 50000
GROUP BY dept_id
HAVING AVG(salary) > 60000;


SHOW TABLES;
DESC employees;
DESC dept;