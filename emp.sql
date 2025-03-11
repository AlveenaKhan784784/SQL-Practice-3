USE company;

CREATE TABLE emp(
emp_id INT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(50),
salary DECIMAL(10,2),
hire_date DATE,
location VARCHAR(50)
);

INSERT INTO emp VALUES
(1,'Alice','HR',50000,'2021-03-15','New York'),
(2,	'Bob', 'IT',70000, '2020-07-20','Chicago'),
(3,	'Charlie','IT',90000,'2019-02-05','San Francisco'),
(4,'David',	'Finance',65000,'2022-06-12','Chicago'),
(5, 'Emma', 'HR', 48000, '2021-09-30', 'New York'),  
(6, 'Frank', 'Finance', 72000, '2018-12-10', 'San Francisco'),  
(7, 'Grace', 'IT', 85000, '2023-01-25', 'New York'),  
(8, 'Henry', 'HR', 55000, '2022-11-08', 'Chicago');

SELECT department, AVG(salary) as avg_sal
FROM emp
GROUP BY department
HAVING avg_sal > 60000;

SELECT location, SUM(salary) as total
FROM emp
GROUP BY location;

SELECT department, COUNT(emp_id) as number_of_employees
FROM emp
GROUP BY department;

SELECT department, max(salary) as max, min(salary) as min
FROM emp
GROUP BY department;

SELECT emp_id,name,salary
FROM emp
WHERE salary > (SELECT AVG(salary) FROM emp);

SELECT emp_id, name, department, salary  
FROM emp  
WHERE salary > (  
    SELECT AVG(salary)  
    FROM emp AS e2  
    WHERE e2.department = emp.department  
);

SELECT department, SUM(salary) AS total_salary  
FROM emp 
GROUP BY department  
ORDER BY total_salary DESC  
LIMIT 1;

