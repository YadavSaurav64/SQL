SELECT VERSION();

SHOW DATABASES;

USE company_db;

SELECT DATABASE();

CREATE TABLE dept (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employees (
  emp_id INT AUTO_INCREMENT  PRIMARY KEY,
  emp_name VARCHAR(100) NOT NULL,
  salary DECIMAL(10, 2) NOT NULL CHECK(salary >=0),
  hire_date DATE NOT NULL,
  dept_id INT NULL,
  manager_id INT NULL,

  FOREIGN KEY (dept_id) REFERENCES dept(dept_id) ON DELETE CASCADE 
  ON UPDATE CASCADE,

  FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);


DESC employees;
DESC dept;

INSERT INTO dept VALUES (1, 'ENGINEERING'), (2, 'HR'), (3,'FINANCE'), (4, 'MARKETING');

INSERT INTO dept (dept_name, dept_id) VALUES ('SALES',5)

SELECT * FROM dept;

INSERT INTO employees VALUES 

(101,'Rahul',80000, '2022-01-15', 1, NULL),
(102, 'Priya', 60000, '2023-03-10', 1, 101),
(103, 'Amit', 50000, '2023-06-20', 2, NULL),
(104, 'Neha', 90000, '2021-11-05', 3, NULL),
(105, 'Karan', 70000, '2022-08-12', 3, 104),
(106, 'Riya', 60000, '2024-01-08', 1, 101),
(107, 'Dev', 45000, '2024-04-15', 4, NULL),
(108, 'Meera', 75000, '2020-09-22', 5, NULL),
(109, 'Arjun', 50000, '2023-12-01', 5, 108),
(110, 'Isha', 65000, '2024-06-18', NULL, NULL);



SHOW CREATE TABLE employees;

ALTER TABLE employees ADD COLUMN email VARCHAR(100);

ALTER TABLE employees MODIFY COLUMN email VARCHAR(150);

ALTER TABLE employees RENAME COLUMN email TO emp_email;

DESC employees;

ALTER TABLE employees DROP COLUMN emp_email;

/* we are not using DROP or TRUNCATE cause they can be dangerous and we want to keep the data for future reference */